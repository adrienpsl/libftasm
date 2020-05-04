
; http://www.int80h.org/strlen/

section .text
    global _ft_strlen

_ft_strlen:
    push rbp
    mov  rbp,rsp

    sub rcx, rcx    ; = 0
    not rcx         ; = -1, or max int
    sub al, al      ; al => null
    cld             ; clear direction flag
    repne scasb     ;
    not	rcx         ; inverse
    dec rcx         ; delete the 0
    mov rax, rcx

    leave
    ret
