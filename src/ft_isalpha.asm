
SECTION .text
    global _ft_isalpha


_ft_isalpha:

init:
    push rbp
    mov  rbp,   rsp
    mov rax, 1

do_test:
    cmp rdi, 'A'   ; < 'A'
    jb set_not
    cmp rdi, 'z'  ; > 'z'
    ja set_not
    jmp out

set_not:
    mov rax, 0

out:
    leave
    ret
