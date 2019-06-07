section .data
input_fmt: db "%d", 0
output_fmt: db "%d ", 0
empty_str: db "", 0

extern scanf
extern malloc
extern free
extern printf
extern puts

global main
section .text
main:
    mov rbp, rsp
	sub rsp, 4
    and rsp, -16

	xor eax, eax
	lea rdi, [rel input_fmt]
	lea rsi, [rsp + 4]
	call scanf  ; scanf("%d", &n)

	mov r13d, [rsp + 4]  ; n in %r13d

	lea rdi, [r13d * 4]
	call malloc  ; malloc(n * 4)
	mov rbx, rax  ; the address in %rbx

	xor r12d, r12d  ; loop variable
	input_loop:
		xor eax, eax
		lea rdi, [rel input_fmt]
		lea rsi, [rbx + r12 * 4]
		call scanf
		add r12, 1
		cmp r12d, r13d
		jl input_loop

	mov rsi, rbx
	mov rdi, r13
	call bubble

	xor r12d, r12d
	output_loop:
		xor eax, eax
		lea rdi, [rel output_fmt]
		mov rsi, [rbx + r12 * 4]
		call printf
		add r12, 1
		cmp r12d, r13d
		jl output_loop


	lea rdi, [rel empty_str]
	call puts ; print empty line

	mov rdi, rbx
	call free

	xor eax, eax
    mov rsp, rbp
	ret

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
