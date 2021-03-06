
%define i rcx
%define src          rsi
%define dest         rdi
%define return       r8

section .text
    global _ft_memcpy

_ft_memcpy:
    push rbp
    mov  rbp,    rsp

    mov  return, rdi     ; init rep
    mov  dest,   rdi
    mov  src,    rsi
    mov  i,      rdx

    cld                  ; clear direction flag
    rep	movsb            ; rep until rcx == 0 // put [rdi] = al
    mov rax, return      ; return memory

    leave
    ret
