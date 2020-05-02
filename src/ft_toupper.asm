
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
    jb out
    cmp rdi, 'z'  ; >
    ja out

    ; update
    sub rax, 32

out:
    leave
    ret
