# COD 课内实验 1: 冒泡排序

*by taoky*，有删减。

要求：使用汇编完成冒泡排序算法程序。

[TOC]

## 整体计划

计划这个汇编程序能够在 macOS 和 Linux (AMD64) 上执行——由于这两个系统的 64 位 calling conventions (System V AMD64 ABI) 是相同的，通过调用 C 库函数（而不是直接搞系统调用），理论上可以实现这个计划。不同的环境可以用不同的 `Makefile` 去调整。

使用 `nasm`，Intel 语法（其实一开始是用 GAS 写的，但是最后手写 AT&T 语法汇编不能忍，就推倒重写了）。想要支持 Linux 的主要原因是 `gdb` 的插件  `gdb-peda` 调试汇编程序非常方便（我的 CSAPP bomblab 就是用 `gdb-peda` 做的），而 macOS 下 `lldb` 用不习惯，自己安装的 `gdb` 还需要代码签名等非常繁琐的步骤才能用。

### 为什么是 64 位程序？

x86-64 虽然寄存器变多了，但是在不同平台的具体的细节变得更加复杂，也有一些坑（后面会提到）。但是由于 **macOS 目前最新的工具链已经无法编译 32 位的应用程序**，最后还是用了 x86-64。

## ~~从 0 开始的~~ 64 位程序汇编编写

### 准备

由于计划链接上 C 库，我们的 entrypoint 就变成了 `main()`（而不是 `_start()`）。所以让我们先写一个最小的汇编程序：进入 `main()` 之后，啥都不干就直接 `ret`。

```assembly
global main
section .text
main:
	ret
```

*看起来没有问题*

用 `nasm` 汇编：

```
$ nasm -felf64 1.asm  # Linux
$ nasm -fmacho64 1.asm  # macOS
```

之后在 Linux 下没有什么问题：

```
[tao@tao-linux-vmware test]$ gcc 1.o -o 1
[tao@tao-linux-vmware test]$ ./1
```

但是在 macOS 下：

```
(base) ➜  test git:(master) ✗ clang 1.o -o 1
Undefined symbols for architecture x86_64:
  "_main", referenced from:
     implicit entry/start for main executable
ld: symbol(s) not found for architecture x86_64
clang: error: linker command failed with exit code 1 (use -v to see invocation)
```

发现 macOS 有给函数前面加下划线的~~癖好~~要求[^1][^2]，但是 Linux 不需要。解决方法：

```
(base) ➜  test git:(master) ✗ nasm -fmacho64 --prefix _ 1.asm
```

通过 `nasm` 的 `--prefix` 参数实现 global 和 extern 的函数前面加前缀 `_`。

接下来让我们随便调用一个 C 库函数试试——我们选择 `malloc()`。Calling conventions 要求第一个参数在 `edi` 里面。

```assembly
global main
extern malloc  ; required by nasm
section .text
main:
	mov edi, 1
	call malloc
	ret
```

*除了内存泄漏以外，看起来没有问题*

我们来跑一下看看……

macOS:

```
(base) ➜  test git:(master) ✗ nasm -fmacho64 --prefix _ 2.asm
(base) ➜  test git:(master) ✗ clang 2.o -o 2                 
(base) ➜  test git:(master) ✗ ./2                            
[1]    1423 segmentation fault  ./2
```

Linux:

```
[tao@tao-linux-vmware test]$ nasm -felf64 2.asm
[tao@tao-linux-vmware test]$ gcc 2.o -o 2
/usr/bin/ld: 2.o: relocation R_X86_64_PC32 against symbol `malloc@@GLIBC_2.2.5' can not be used when making a PIE object; recompile with -fPIC
/usr/bin/ld: 最后的链结失败: bad value
collect2: 错误：ld 返回 1
```

在这两个平台都遇到了一些预料之外的问题。首先 Linux 下由于新的发行版为了安全性，都默认在编译时开启了 PIE（Position Independent Executables | 位置无关可执行程序，在 ASLR 打开的情况下，会对 `.text` 等段随机化基址），需要一些特殊的处理，我们这里为了「跨平台」方便，关闭 PIE。

```
[tao@tao-linux-vmware test]$ gcc 2.o -no-pie -o 2
[tao@tao-linux-vmware test]$ ./2
```

这里没有问题。

那么 macOS 下发生了什么？我们用 `lldb` 看看。

```
* thread #1, queue = 'com.apple.main-thread', stop reason = EXC_BAD_ACCESS (code=EXC_I386_GPFLT)
    frame #0: 0x00007fff7451ec92 libdyld.dylib`stack_not_16_byte_aligned_error
libdyld.dylib`stack_not_16_byte_aligned_error:
->  0x7fff7451ec92 <+0>: movdqa %xmm0, (%rsp)
    0x7fff7451ec97 <+5>: int3   

libdyld.dylib`_dyld_fast_stub_entry:
    0x7fff7451ec98 <+0>: pushq  %rbp
    0x7fff7451ec99 <+1>: movq   %rsp, %rbp
Target 0: (2) stopped.
```

可以注意到 `stack_not_16_byte_aligned_error`，表明我们的栈需要 16 字节对齐。

如何正确对齐？我们可以手动将 `rsp` 减去/加上某个值来对齐[^3]。

```assembly
main:
	sub rsp, 8
	mov edi, 1
	call malloc
	add rsp, 8
	ret
```

当然[^3]：

> If you are not sure about alignment, use some spare register to store original `rsp` (often `rbp` is used, so it also functions as stack frame pointer), and then `and rsp,-16` to clear the bottom bits.

在一开始把 `rsp` 赋给 `rbp`（或者其他的寄存器），然后把 `rsp` 与 `-16` 相与，也可以对齐。

问题解决之后，我们来写一下对应不同平台的 `Makefile`，参考了一个 `Makefile` 示例[^1]。

```makefile
SOURCES = $(wildcard *.asm)
OBJECTS = $(SOURCES:.asm=.o)
EXECUTABLES = $(OBJECTS:.o=)

# Generic rule
# $< is the first dependency name
# $@ is the target filename
%.o: %.asm
	nasm --prefix _ -f macho64 $<

default: $(OBJECTS)
	for exe in $(EXECUTABLES) ; do \
		clang $$exe.o -o $$exe ; \
	done

.PHONY: clean
clean:
	rm *.o
	for exe in $(EXECUTABLES) ; do \
		rm $$exe ; \
	done
```

*macOS 版本的 `Makefile`*

```makefile
SOURCES = $(wildcard *.asm)
OBJECTS = $(SOURCES:.asm=.o)
EXECUTABLES = $(OBJECTS:.o=)

# Generic rule
# $< is the first dependency name
# $@ is the target filename
%.o: %.asm
	nasm -f elf64 $<

default: $(OBJECTS)
	for exe in $(EXECUTABLES) ; do \
		gcc -no-pie $$exe.o -o $$exe ; \
	done

.PHONY: clean
clean:
	rm *.o
	for exe in $(EXECUTABLES) ; do \
		rm $$exe ; \
	done
```

*Linux 版本的 `Makefile`*

### `main()`

我们计划 `main()`:

1. 读入 `n`，存在栈上。
2. 根据 `n` 使用 `malloc()` 申请堆上内存。
3. 读入 `n` 个数，存在堆上。
4. 调用函数，（原地）冒泡排序。
5. 输出排序好的 `n` 个数。
6. `free()` 释放堆上内存。
7. 恢复栈，`ret`。

不考虑错误处理以降低编写成本。

#### 空间分配与栈对齐

```assembly
mov rbp, rsp
sub rsp, 4
and rsp, -16
```

我们这里分配 4 字节的空间存储 `n`，并且对齐栈。退出函数前 `mov rsp, rbp` 即可。

#### 调用 `scanf()`

`scanf()` 等函数需要一个格式化字符串。我们把它放在 `.data` 里：

```assembly
section .data
input_fmt: db "%d", 0
output_fmt: db "%d ", 0
empty_str: db "", 0
```

`nasm` 中字符串最后要手动补 0。

```assembly
xor eax, eax
lea rdi, [rel input_fmt]
lea rsi, [rsp + 4]
call scanf  ; scanf("%d", &n)

mov r13d, [rsp + 4]  ; n in %r13d
```

调用 `scanf()` 前做了这样一些事情：

- 我们不输入浮点数（向量参数），根据 calling conventions，`al` 为 0，即把 `eax` 清零。
- 用相对赋值的办法使 `rdi`（第一个参数）指向格式化字符串。
- `rsi`（第二个参数）指向栈上空位。

为什么要 `[rel input_fmt]`？如果把 `rel` 去掉，在 macOS 下会汇编出错：

```
error: Mach-O 64-bit format does not support 32-bit absolute addresses
```

这与 64 位 macOS 加载程序到虚拟内存的方式有关[^4]。

最后，`n` 在 `r13d`（`r13` 的低 32 位）里面。

#### `malloc()`

```assembly
lea rdi, [r13d * 4]
call malloc  ; malloc(n * 4)
mov rbx, rax  ; the address in %rbx
```

与之前类似，申请 `n * 4` 字节的空间（`sizeof(int)` 为 4），最后把返回值（我们要的地址）`rax` 赋给 `rbx`。

#### 循环输入/输出

我们的数字输入/输出使用循环。

```assembly
xor r12d, r12d  ; loop variable
input_loop:
	xor eax, eax
	lea rdi, [rel input_fmt]
	lea rsi, [rbx + r12 * 4]
	call scanf
	add r12, 1
	cmp r12d, r13d
	jl input_loop
```

以 `r12d` 为循环的变量，从 0 开始，小于 `r13d` 时循环。选择 `r12` 为循环变量是考虑到 `rbx`, `rbp`, `r12-15` 是 callee-saved 的，执行完 `scanf()` 之后不会乱掉。

输出同理。

#### 调用 `bubble()`

我们计划的函数 `bubble()` 遵循 calling conventions，取两个变量：`rsi` 为数组地址，`rdi` 为数字个数。

```assembly
mov rsi, rbx
mov rdi, r13
call bubble
```

#### `main()` 返回值

`main()` 应该返回 0，否则 shell 会认为这个程序执行失败。

```
(base) ➜  bubble2 git:(master) ✗ echo $?  # after running our program
7
```

`xor eax, eax` 即可。

### `bubble()`: ~~真正的~~冒泡排序

#### 算法

偷个懒，直接拿 PPT 里的算法思路来写：

```
1. j <- n - 1
2. if A[j] < A[j - 1], swap(A[j], A[j - 1])
3. j <- j - 1; if j > 0 goto 2.
4. if has_swapped goto 1.
```

但是，如果 `n` 为 1，`j` 就为 0，`j - 1` 就小于 0，会出错，所以稍微做一下修改：

```
1. goto 3.
2. if has_swapped is false, FIN.
3. j <- n, and clear has_swapped
4. j <- j - 1; if j <= 0, goto 2.
5. if A[j] < A[j - 1], swap(A[j], A[j - 1])
6. goto 4.
```

#### 开写！

照着上面的思路写就行了，只是需要注意 32 位和 64 位寄存器的使用问题，还有尽量不要使用 callee-save 的寄存器。 

```assembly
bubble:  ; n = %edi, array = %rsi

	jmp sort_loop_s

	sort_loop:
		test eax, eax  ; a swap occurred?
		je fin
	sort_loop_s:
		xor eax, eax
		; lea ecx, [edi - 1]
		mov ecx, edi
		loop_2:
			sub ecx, 1
			test ecx, ecx
			jle sort_loop
			mov r8d, [rsi + rcx * 4]  ; array[j]
			lea rdx, [rcx - 1]
			mov r9d, [rsi + rdx * 4]  ; array[j - 1]
			cmp r9d, r8d
			jl loop_2  ; array[j - 1] < array[j] ?
			mov eax, 1
			mov [rsi + rcx * 4], r9d
			mov [rsi + rdx * 4], r8d  ; swap
			jmp loop_2
			

	fin:
		ret
```

这里没有必要对栈做什么事情，因为我们没有调用别的函数，也没有在栈上存数据的需要。

## 正确性测试

测试排序程序的正确性，最简单的方法就是生成一些随机数，看看我们的程序的排序结果和「标准」程序的排序结果是否相同。

用 Python 来生成数据。

```python
from random import randint

f = open("random.txt", "w")
fa = open("answer.txt", "w")

n = 1000
f.write("%d\n" % n)

array = [randint(-2**31, 2**31-1) for i in range(n)]
for i in array:
    f.write("%d " % i)

array.sort()

for i in array:
    fa.write("%d " % i)

fa.write("\n")

f.close()
fa.close()
```

其中 `random.txt` 存放程序的输入，`answer.txt` 存放排序后的结果。

运行时可以：

```
./bubble < random.txt > test.txt
```

将我们的程序结果输出到 `test.txt`。

然后 `diff` 一下。

```
(base) ➜  bubble2 git:(master) ✗ diff test.txt answer.txt 
(base) ➜  bubble2 git:(master) ✗ 
```

没有输出，说明完全一致，程序正确。

为了方便，可以写一个 shell 脚本。

```sh
make clean

set -e
make
./bubble < random.txt > test.txt
diff test.txt answer.txt

echo "Test OK!"
```

如果全过程无误，就会输出 `Test OK!`，这样迭代程序就方便多了。

## References

[^1]: Let's Write Some X86-64: https://nickdesaulniers.github.io/blog/2014/04/18/lets-write-some-x86-64/
[^2]: What is the difference between assembly on mac and assembly on linux?: https://stackoverflow.com/questions/19720084/what-is-the-difference-between-assembly-on-mac-and-assembly-on-linux
[^3]: Understanding stack alignment: https://stackoverflow.com/questions/48683962/understanding-stack-alignment
[^4]: Mach-O 64-bit format does not support 32-bit absolute addresses. NASM Accessing Array: https://stackoverflow.com/questions/47300844/mach-o-64-bit-format-does-not-support-32-bit-absolute-addresses-nasm-accessing