
section .text
    global _main
    global start

start:
    call _main
    ret

goOut:
    leave
    ret

_main:
    push rbp
    mov rbp,    rsp
    mov rdx,    output      ; hold address of next byte to write
    mov r8,     1           ; initial length
    mov r9,     0           ; number of starts written on line so far

line:
    mov byte [rdx], '*'     ; write single star
    inc rdx                 ; advance ptr to next cell to write
    inc r9                  ; line counter
    cmp r9,     r8          ; did we reach the max start for that line
    jne line                ; if not, go to line

lineDone:
    mov byte [rdx], 10      ; write new line
    inc rdx                 ; move ptr start new line
    inc r8                  ; next line will be one char longer
    mov r9, 0               ; reset current line counter
    cmp r8, maxLines        ; is the last line ?
    jng line                ; if not, write new line.

done:
    mov rax,     0x2000004  ; write
    mov rdi,     1          ;std
    mov rsi,        output  ; address of the string to output
    mov rdx,        dataSize; number of byte to write
    syscall                 ; ... syscall
    call goOut


section .bss
maxLines     equ 8
dataSize    equ 44
output:     resb dataSize
