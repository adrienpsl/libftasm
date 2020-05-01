; adpuser bitch

%define MACH_SYSCALL(nb) 0x02000000 | nb
%define STDOUT 1
%define WRITE 4

%define buff_addr       rdx
%define lineNb          r8
%define charCounter     r9
%define total           r10


section .text
    global start
    global _main

start:
    call _main
    ret

quit:
    leave
    ret

_main:
    push rbp                          ; save address of previous stack frame
    mov rbp, rsp                      ; Address of current stack frame
    sub rsp, 0xA                      ; Reserve 16 bytes of current stack frame
    mov buff_addr,  buffer

    mov charCounter,    0             ; nb current line char
    mov lineNb,         1             ; nb total line

lineLoop:
    mov byte [buff_addr], '*'         ; write in the buffer
    inc buff_addr                     ; inc buffer position for next char
    inc total                         ; all char

    inc charCounter                   ; inc current line char
    cmp charCounter, lineNb           ; loop until
    jne lineLoop

newLine:
    mov byte [buff_addr], 10
    inc buff_addr
    inc total

    inc lineNb
    mov charCounter, 0
    cmp lineNb, lineLimit
    jng lineLoop

print_line:
    mov rax, MACH_SYSCALL(WRITE)
    mov rdi, STDOUT
    mov rsi, buffer
    mov rdx, total
    syscall
    call quit

section .bss
    bufferSize  equ 100
    lineLimit   equ 8
    buffer:     resb bufferSize

