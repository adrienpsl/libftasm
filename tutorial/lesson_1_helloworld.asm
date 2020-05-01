; Hello World Program - asmtutor.com
; Compile with: nasm -f elf helloworld.asm
; Link with (64 bit systems require elf_i386 option): ld -m elf_i386 helloworld.o -o helloworld
; Run with: ./helloworld


%define MACH_SYSCALL(nb) 0x02000000 | nb
%define STDOUT 1
%define WRITE 4


SECTION .data
msg     db      'Hello World!', 0Ah     ; assign msg variable with your message string

SECTION .text
global  _start

_start:
    mov     rdx, 13             ; number of bytes to write - one for each letter plus 0Ah (line feed character)
    mov     rcx, msg            ; move the memory address of our message string into ecx
    mov     rbx, 1              ; write to the STDOUT file
    mov     MACH_SYSCALL(4)     ; invoke SYS_WRITE (kernel opcode 4)
    syscall
    leave
