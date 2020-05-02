



section .text



section .data

hello:
    .string db "Hello World", 10
    .len equ $ - hello.string
