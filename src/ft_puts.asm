

%define i r8
%define ptr rdi

%macro call_write 1
mov     rax, 0x02000004
lea     rsi, %1
mov     rdi, 1
mov     rdx, i
syscall

cmp     rax, -1                  ; if  function fail
je      handle_write_error

mov     rax, 10                  ; ret >        0
%endmacro


section .text
    global _ft_puts

_ft_puts:
    push rbp
    mov  rbp,       rsp

    cmp  rdi,       0   ; input == NULL
    je   input_null

    mov i,  0           ; letter counter
    mov r8, 0

; print element
get_size:
    cmp byte [ptr + i], 0
    je  write
    inc i
    jmp get_size

; put str ?
write:
    call_write [ptr]
    mov r8,   1
    call_write [rel  space]
    jmp out

handle_write_error:
    mov rax, -1

input_null:
    mov i, null.len
    call_write [rel null.string]
    mov rax, 10

out:
    leave
    ret

section .data
space: db 10

null:
    .string db "(null)", 10
    .len equ $ - null.string
