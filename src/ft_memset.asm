
%define loop_counter    rcx
%define ptr_string      rdi
%define start           r8
%define new_char        al

section .text
    global _ft_memset


_ft_memset:
    push rbp
    mov  rbp,   rsp

    mov start, rdi
    mov new_char, 'c'
    mov loop_counter, rdx
    cld                    ; clear direction flag
    rep	stosb              ; rep until rcx == 0
                           ; put [rdi] = al
    mov rax, start         ; return memory

    leave
    ret

