#!/usr/bin/env bash

#nasm -fmacho64 syscall.asm
#nasm -fmacho64 print_hello_world.asm
#ld syscall.o print_hello_world.o -macosx_version_min 10.8 -lSystem -o hell;
#./hell

#nasm -f macho64 syscall.asm
#ld syscall.o -macosx_version_min 10.8 -lSystem -o hell


nasm -fmacho64 triangle2.asm
ld triangle2.o -macosx_version_min 10.8 -lSystem -o hell
