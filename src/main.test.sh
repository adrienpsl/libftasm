
nasm -fmacho64 ft_bzero.asm
gcc -c main.c
ld  main.o \
    ft_bzero.o \
  -macosx_version_min 10.14 -lSystem -o hell

./hell
