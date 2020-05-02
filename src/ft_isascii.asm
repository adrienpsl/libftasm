
SECTION .text
    global _ft_isascii


_ft_isascii:

init:
    push rbp
    mov  rbp,   rsp
    mov rax, 1

do_test:
    cmp rdi, 0   ; < '0'
    jb set_not
    cmp rdi, 127  ; > '9'
    ja set_not
    jmp out

set_not:
    mov rax, 0

out:
    leave
    ret
