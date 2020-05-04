
%define s1        [ rbp - 0x8*1 ]      ;
%define s1_length [ rbp - 0x8*2 ]
%define s2        [ rbp - 0x8*3 ]     ;
%define s2_length [ rbp - 0x8*4 ]     ;
%define start     [ rbp - 0x8*5 ]

%macro set_arg 3
    mov rdi, %1
    mov rsi, %2
    mov rdx, %3
%endmacro

[BITS 64]

SECTION .text
    global _ft_strcat
    extern _ft_strlen
    extern _ft_memcpy

_ft_strcat:
    push rbp
    mov  rbp,   rsp

    sub  rsp, 0x8 * 6

save_ptr:
    mov start, rdi                 ; save for return start str
    mov s1,    rdi
    mov s2,    rsi

get_both_size:
    set_arg s1,        0,  0
    call    _ft_strlen
    mov     s1_length, rax         ; add his length to s1

    set_arg s2,        0,  0
    call    _ft_strlen
    mov     s2_length, rax         ; add his length to s1

move_end_s1:
    mov r9, s1                     ; compute all s1 size
    add r9, s1_length
    mov s1, r9

copy:
    set_arg s1, s2, s2_length      ; copy value
    call _ft_memcpy

add_terminating_0:
    mov r9, start
    add r9, s2_length
    add r9, s1_length
    mov byte [r9], 0

    mov rax, start

    leave
    ret
