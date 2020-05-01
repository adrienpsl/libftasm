%define MACH_SYSCALL(nb) 0x02000000 | nb
%define STDOUT 1
%define WRITE 4

global _hello_print

section .data

hello:
    .string db "Hello World!", 10
    .len equ $ - hello.string

section .text

_hello_print:
    push rbp
    mov rbp, rsp
    mov rdi, STDOUT
    lea rsi, [rel hello.string]
    mov rdx, hello.len
    mov rax, MACH_SYSCALL(WRITE)
    syscall
    leave
    ret

