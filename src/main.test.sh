
nasm -fmacho64 ft_bzero.asm
nasm -fmacho64 ft_strcat.asm
nasm -fmacho64 ft_isalpha.asm
gcc -c main.c

ld  main.o \
    ft_bzero.o ft_strcat.o ft_isalpha.o \
  -macosx_version_min 10.14 -lSystem -o hell

rm *.o
./hell