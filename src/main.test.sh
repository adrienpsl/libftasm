
nasm -fmacho64 ft_bzero.asm
nasm -fmacho64 ft_strcat.asm
nasm -fmacho64 ft_isalpha.asm
nasm -fmacho64 ft_isdigit.asm
nasm -fmacho64 ft_isascii.asm
nasm -fmacho64 ft_isalnum.asm
nasm -fmacho64 ft_isprint.asm
nasm -fmacho64 ft_toupper.asm
nasm -fmacho64 ft_tolower.asm
nasm -fmacho64 ft_puts.asm
nasm -fmacho64 ft_strlen.asm
nasm -fmacho64 ft_memset.asm
gcc -c main.c

ld  main.o \
ft_bzero.o   ft_strcat.o  ft_isalpha.o ft_isdigit.o \
ft_isascii.o ft_isalnum.o ft_isprint.o ft_toupper.o \
ft_tolower.o ft_puts.o    ft_strlen.o  ft_memset.o  \
  -macosx_version_min 10.14 -lSystem -o hell

rm *.o
./hell
