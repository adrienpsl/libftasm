
SECTION .text
    global _ft_isdigit


_ft_isdigit:

init:
    push rbp
    mov  rbp,   rsp
    mov rax, 1

do_test:
    cmp rdi, '0'   ; < '0'
    jb set_not
    cmp rdi, '9'  ; > '9'
    ja set_not
    jmp out

set_not:
    mov rax, 0

out:
    leave
    ret
