
%define s1      rdi
%define s2      rsi
%define start   r8
%define y       r9

SECTION .text
    global _ft_bzero


_ft_strcat:

init:
    push rbp
    mov  rbp,   rsp

    mov  start,    s1;

get_end_s1:
    test s1, 0
    jz copy_into
    inc s1
    jmp get_end_s1

copy_into:
    test s2, 0
    jz end
    mov byte [s1], byte [s2]
    inc s1
    inc s2
    jmp copy_into

end:
    mov rax, start
    leave
    ret
