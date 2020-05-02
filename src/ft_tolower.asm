
SECTION .text
    global _ft_tolower


_ft_tolower:
    ; init
    push rbp
    mov  rbp,   rsp

    ; set
    mov rax, rdi

    ; test
    cmp rdi, 'A'   ; <
    jb out
    cmp rdi, 'Z'  ; >
    ja out

    ; update
    add rax, 32

out:
    leave
    ret
