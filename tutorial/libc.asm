section .data
hello:
    .string db "Hello World!", 10 ; ,10 -> \n
    .len equ $ - hello.string ; $ - -> taille de la string
                              ; diff d'address entre les deux
section .text
    global start
    global _main
    extern _printf

start:
    call _main
    ret

_main:
    push rbp  ; je pense que je suis obliger de faire ca
    mov rbp, rsp ; je mets rsp dans rbp, pourquoi?
    sub rsp, 16 ; je decalle de 16
    lea rdi, [rel hello.string] ; load effective address rdi
    call _printf
    leave ; je suis aussi obliger de faire ca?
    ret ; end