
%define i        rcx
%define start    r8
%define new_char al

section .text
    global _ft_memset


_ft_memset:
    push rbp
    mov  rbp, rsp

    mov start,    rdi
    mov new_char, 'c'
    mov i,        rdx
    cld                    ; clear direction flag
    rep	stosb              ; rep until rcx == 0
                           ; put [rdi] = al
    mov rax, start         ; return memory

    leave
    ret
