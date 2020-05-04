
SECTION .text
    global _ft_toupper


_ft_toupper:
    ; init
    push rbp
    mov  rbp,   rsp

    ; set
    mov rax, rdi

    ; test
    cmp rdi, 'a'   ; <
    jb  out
    cmp rdi, 'z'  ; >
    ja  out

    sub rax, 32  ; a -> A

out:
    leave
    ret
