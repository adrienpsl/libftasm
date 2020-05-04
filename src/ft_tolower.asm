
SECTION .text
    global _ft_tolower

_ft_tolower:
    ; init
    push rbp
    mov  rbp,   rsp

    mov rax, rdi

    cmp rdi, 'A'   ; <
    jb  out
    cmp rdi, 'Z'  ; >
    ja  out

    add rax, 32   ; A -> a

out:
    leave
    ret
