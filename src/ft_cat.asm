%define readRet     r8
%define STDIN       1
%define sys_read    0x2000003
%define sys_write   0x2000004
%define current_fd  [rbp - 0x8*1]

%macro do_syscall 3
    mov rax, %1       ; read syscall
    mov rdi, %2
    lea rsi, [rel buff]
    mov rdx, %3
    syscall
%endmacro


SECTION .text
    global _ft_cat


_ft_cat:
    push rbp
    mov  rbp, rsp

    cmp edi, 0          ; because int = 32bits
    jl _out             ; jump if less, bad fd
    mov current_fd, rdi

read:
    do_syscall sys_read, current_fd, buffSize

    mov readRet, rax  ; cmp read ret
    cmp readRet, 0    ; check read return
    jle _out          ; less or ==

print:
    do_syscall sys_write, STDIN, readRet
    jmp read

_out:
    leave
    ret

section .bss
    buffSize equ 10000
    buff: resb buffSize
