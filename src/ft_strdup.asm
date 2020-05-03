%define MACH_SYSCALL(nb) 0x02000000 | nb

%define memory_size [rsp + 0x8*1]
%define origin [rsp + 0x8*2]
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

    sub  rsp, (0x10 * 2)             ; start, size, malloc return
    mov qword origin, rdi              ; start string

    call _ft_strlen
    add rax, 1         ; \0
    push Qword rax
;    push Qword rax

;    pop Qword rdi
    sub rsp, 8
    mov rdi, rax
    call _malloc
    cmp rax, 0          ; if fail
    je _out
    add rsp, 16
    mov memory, rax     ; put in memory malloc

    mov rdi, memory     ; set up
    mov rsi, origin
    mov rdx, 1000
    call _ft_memcpy     ; set the good return

_out:
    leave
    ret

   ; compter le nombre de char
   ; malloc
   ; copy
   ; return
