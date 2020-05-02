
%define s1      rdi
%define s2      rsi
%define start   r8
%define tmp     r9b

SECTION .text
    global _ft_strcat


_ft_strcat:

init:
    push rbp
    mov  rbp,   rsp

    mov  start,    s1;

get_end_s1:
    cmp byte [s1], 0x0
    je copy_into
    inc s1
    jmp get_end_s1

copy_into:
    cmp byte[s2], 0x0
    jz end
    mov tmp, [s2]
    mov byte [s1], tmp
    inc s1
    inc s2
    jmp copy_into

end:
    mov byte[s1], 0
    mov rax, start
    leave
    ret
