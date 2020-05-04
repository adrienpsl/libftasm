%define MACH_SYSCALL(nb) 0x02000000 | nb
%define STDOUT 1
%define WRITE 4
%define i r8
%define ptr rdi

%define size_arg

%macro call_write 1
    mov rax, MACH_SYSCALL(WRITE)
    mov rdi, STDOUT                          ; fd
    lea rsi, %1                              ; str
    mov rdx, i                               ; str size
    syscall

    cmp rax, -1                              ; read fails
    je handle_write_error

    mov rax, 10                              ; return > 0 if no fail
%endmacro

section .text
    global _ft_puts

_ft_puts:
    push rbp
    mov  rbp, rsp

    cmp rdi, 0                               ; input == NULL
    je  input_null

    mov i, 0                                 ; letter counter

get_size:
    cmp byte     [ptr + i], 0
    je  write
    inc i
    jmp get_size

write:
    call_write [ptr]
    call_write [rel space]
    jmp out


input_null:
    mov        i,  null_str.len
    call_write [rel null_str.string]
    mov        rax, 10

handle_write_error:
    mov rax, -1

out:
    leave
    ret

section .data
    space: db 10

null_str:
    .string db "(null)", 10
    .len equ $ - null_str.string
