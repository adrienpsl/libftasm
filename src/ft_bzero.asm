%define i       r8
%define string  rdi
%define size    rsi

SECTION .text
    global _ft_bzero


_ft_bzero:

init:
    push rbp
    mov  rbp,   rsp

    mov  i,    0

set_bit_0:
    cmp i, size
    je  end
    mov byte [string], 0
    inc i
    inc string
    jmp set_bit_0

end:
    leave
    ret
