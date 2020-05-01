cmake_minimum_required(VERSION 3.16)
project(libftasm C)

set(CMAKE_C_STANDARD 99)
enable_language(ASM_NASM)

set(CMAKE_ASM_NASM_OBJECT_FORMAT elf64)
set(CMAKE_ASM_NASM_COMPILE_OBJECT "<CMAKE_ASM_NASM_COMPILER> <INCLUDES> \
    <FLAGS> -f ${CMAKE_ASM_NASM_OBJECT_FORMAT} -o <OBJECT> <SOURCE>")

set_source_files_properties(tutorial/libc.asm PROPERTIES COMPILE_FLAGS "-g -Fdwarf")

set(CMAKE_CXX_STANDARD 11)

#add_executable(libftasm
#        main
#        src/ft_strlen.s)
#
add_executable(libftasm main.c tutorial/libc.asm)