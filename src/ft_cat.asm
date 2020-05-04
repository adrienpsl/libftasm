%define readRet     r8
%define STDIN       1
%define s_read    0x2000003
%define s_write   0x2000004
%define fd  [rbp - 0x8*1]

%macro do_sys 3
    mov rax, %1                    ; read syscall
    mov rdi, %2
    lea rsi, [rel buff]            ; always same buffer
    mov rdx, %3
    syscall
%endmacro

SECTION .text
    global _ft_cat

_ft_cat:
    push rbp
    mov  rbp, rsp

    cmp edi, 0                     ; because fd int = 32bits
    jl _out                        ; jump if less, bad fd
    mov fd, rdi

read:
    do_sys s_read, fd, buffSize
    mov readRet, rax               ; cmp read ret
    cmp readRet, 0                 ; check read return
    jle _out                       ; less or ==

print:
    do_sys s_write, STDIN, readRet
    jmp    read

_out:
    leave
    ret

section .bss
    buffSize equ  10000
    buff:    resb buffSize
