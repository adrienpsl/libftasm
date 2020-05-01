


[BITS 64]

extern _hello_print

section .text
    global start
    global _main

start:
    call _main
    ret

_main:
    push rbp
    mov rbp, rsp
;    sub rsp, 16 ; on grossit la pile vers le bas pour mettre des
                ; variable
    call _hello_print
    leave
    ret

