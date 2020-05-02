

SECTION .text
    global _ft_isalnum

    extern _ft_isdigit
    extern _ft_isalpha


_ft_isalnum:

init:
    push rbp
    mov  rbp,   rsp

do_test:
    call _ft_isalpha
    cmp rax, 1  ; if is alpha, say ok
    je out

    call _ft_isdigit

out:
    leave
    ret
