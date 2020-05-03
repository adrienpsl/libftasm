
; pretty
%define MACH_SYSCALL(nb) 0x02000000 | nb

; my stack values
%define size [rbp - 0x8]
%define origin [rbp - 0x8*2]
%define memory [rbp - 0x8*3]

[BITS 64]

SECTION .text
    global _ft_strdup
    extern _ft_strlen
    extern _ft_memcpy
    extern _malloc


_ft_strdup:
    push rbp
    mov  rbp        , rsp

    sub  rsp        , 0x8*4   ; 3 value + padding // align on 16bits
    mov  origin     , rdi     ; save start string

    call _ft_strlen
    mov  size       , rax     ; save string size
    add  qword size , 1       ; add \0

    mov  rdi        , size    ; malloc size
    call _malloc
    mov  memory     , rax     ; save memory ptr

    mov  rdi        , memory  ; set up argument for memcpy
    mov  rsi        , origin
    mov  rdx        , size
    call _ft_memcpy           ; memcpy return is the same.

_out:
    leave
    ret
