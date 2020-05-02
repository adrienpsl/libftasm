%define MACH_SYSCALL(nb) 0x02000000 | nb
%define STDOUT 1
%define WRITE 4

%macro start 0
    push rbp
    mov  rbp,   rsp
%endmacro

%macro call_write 1
    lea rsi, %1
    mov rdi, STDOUT
    mov rdx, r8
    mov rax, MACH_SYSCALL(WRITE)
    syscall

    cmp rax, -1                     ; if function fuckup
    je handle_write_error

    mov rax, 10                     ; set ok return
%endmacro

section .text
    global _ft_puts

_ft_puts:
    start
    cmp rdi, 0
    je input_null


    mov r8, 0
get_size:
    cmp byte [rdi + r8], 0
    je write
    inc r8
    jmp get_size

write:
    call_write [rdi]
    mov r8, 1
    call_write [rel space]
    jmp out

handle_write_error:
    mov rax, -1

input_null:
    mov r8, null.len
    call_write[rel null.string]
    mov rax, 10

out:
    leave
    ret

section .data
space: db 10

null:
    .string db "(null)", 10
    .len equ $ - null.string
