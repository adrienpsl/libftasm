%define MACH_SYSCALL(nb) 0x02000000 | nb

%define size r8
%define origin [rsp + 0x8]
%define size [rsp + 0x8*2]
%define memory [rsp + 0x8*3]

[BITS 64]

SECTION .text
    global _ft_strdup
    extern _ft_strlen
    extern _ft_memcpy
    extern _malloc


_ft_strdup:
    push rbp
    mov  rbp,   rsp

    sub  rsp, (0x8*3)             ; start, size, malloc return
    mov  origin, rdi              ; start string

    mov DWORD [rsp + 4], 2        ; save start string
    call _ft_strlen
    mov size, rax       ; save the size

    mov rdi, size       ; put size for malloc
    call _malloc
    cmp rax, 0          ; if fail
    je _out
    mov memory, rax     ; put in memory malloc

    mov rdi, memory     ; set up
    mov rsi, origin
    mov rdi, size
    call _ft_memcpy     ; set the good return

_out:
    leave
    ret

   ; compter le nombre de char
   ; malloc
   ; copy
   ; return
