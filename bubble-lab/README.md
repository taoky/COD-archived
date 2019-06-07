# Bubble sort with x86-64 on Linux & macOS

文件结构如下：

- report.pdf: 实验报告
- src/
    - bubble.asm: 汇编程序代码
    - Makefile: 适用于 macOS 的 Makefile
    - Makefile.linux: 适用于 Linux 的 Makefile
    - tb.py: 生成测试数据以供测试脚本使用
    - testlinux.sh: Linux 下的测试脚本
    - testosx.sh: macOS 下的测试脚本
- bin/
    - bubble-linux: Linux 下生成的二进制 ELF 程序
    - bubble-osx: macOS 下生成的二进制 machO 程序
