%define i       r8
%define ptr     rdi
%define size    rsi

SECTION .text
    global _ft_bzero

_ft_bzero:
    push rbp
    mov  rbp, rsp

set:
    mov  i, 0

loop:
    cmp i, size
    je  end
    mov byte [ptr] , 0
    inc i
    inc ptr
    jmp loop

end:
    leave
    ret
