%define MACH_SYSCALL(nb) 0x02000000 | nb
%define STDOUT 1
%define WRITE 4
%define i r8
%define ptr rdi

%define size_arg

%macro call_write 1
    mov rax, MACH_SYSCALL(WRITE)
    lea rsi, %1
    mov rdi, STDOUT
    mov rdx, i
    syscall

    cmp rax, -1                     ; if function fuckup
    je handle_write_error

    mov rax, 10                     ; set ok return
%endmacro

section .text
    global _ft_puts

_ft_puts:
    push rbp
    mov  rbp, rsp

    cmp rdi, 0                               ; input == NULL
    je  input_null

    mov i, 0                                 ; letter counter

    mov r8, 0
get_size:
    cmp byte     [ptr + i], 0
    je  write
    inc i
    jmp get_size

write:
    call_write [ptr]
    mov r8, 1
    call_write [rel space]
    jmp out

handle_write_error:
    mov rax, -1

input_null:
    mov        i,  null.len
    call_write [rel null.string]
    mov        rax, 10

out:
    leave
    ret

section .data
space: db 10

null:
    .string db "(null)", 10
    .len equ $ - null.string
