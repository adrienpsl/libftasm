
SECTION .text
    global _ft_isprint

_ft_isprint:
    push rbp
    mov  rbp, rsp

    mov  rax, 1

do_test:
    cmp rdi,    40  ; < '0'
    jb  set_not
    cmp rdi,    176 ; > '9'
    ja  set_not
    jmp out

set_not:
    mov rax, 0

out:
    leave
    ret
