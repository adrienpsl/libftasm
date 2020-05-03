
%define buffer_ptr rdx
%define max_size_line r8
%define line_counter r9

section .text
    global _main
    global start

start:
    call _main
    ret

_main:
    push rbp
    mov rbp,    rsp

    mov buffer_ptr,    output      ; hold address of next byte to write
    mov max_size_line,     1           ; initial length
    mov line_counter,     0           ; number of starts written on line so far
    ; line_counte  = 0

line:
    mov byte [buffer_ptr], '*'     ; write single star
    inc buffer_ptr               ; advance ptr to next cell to write
    inc line_counter                  ; line counter
    cmp line_counter,   max_size_line          ; did we reach the max start for that line
    jne line                ; if not, go to line

lineDone:
    mov byte [buffer_ptr], 10      ; write new line \n
    inc buffer_ptr                 ; move ptr start new line
    inc max_size_line              ; next line will be one char longer
    mov line_counter, 0             ; reset current line counter
    cmp max_size_line , maxLines        ; is the last line ?
    jng line                ; if not, write new line.

done:
    mov rax,     0x2000004  ; write
    mov rdi,     STDIN          ;std
    mov rsi,     output  ; address of the string to output
    mov rdx,     dataSize; number of byte to write
    syscall                 ; ... syscall
    leave
    ret


section .bss
maxLines     equ 10
dataSize    equ  100
output:     resb dataSize
