#____________CONFIG____________#

NAME = libfts.a
NAME_TEST = test
PATH_SRC = ./src/
#PATH_OBJ = ./obj/
#PATH_INC = ./libft/includes/


AS = nasm
ASFLAGS = -f macho64
CC = cc -Wall -Wextra -Werror
# CFLAGS = -f macho64
# CFLAGS = -Ofast -I $(PATH_INC) -g

LIBS = -L ./ -lfts

#____________FILES____________#

SRC =	ft_bzero.asm \
		ft_isalpha.asm \
		ft_isdigit.asm \
		ft_isalnum.asm \
		ft_isascii.asm \
		ft_isprint.asm \
		ft_toupper.asm \
		ft_tolower.asm \
		ft_puts.asm \
		ft_strlen.asm \
		ft_strcat.asm \
		ft_memset.asm \
		ft_memcpy.asm \
		ft_strdup.asm \
#		ft_cat.asm \
		ft_strcmp.asm \
		ft_putchar.asm \
		ft_putchar_fd.asm \
		ft_memcmp.asm \
		ft_strequ.asm \
		ft_strcpy.asm \
		ft_memdel.asm \
		ft_memalloc.asm \
		ft_strnew.asm

OBJ = $(addprefix $(PATH_SRC), $(SRC:.s=.o))


#____________REGLES____________#

.PHONY: clean fclean re test clean_test

all: $(NAME)

$(NAME): $(OBJ)
	ar rc $(NAME) $(OBJ)
	ranlib $(NAME)

clean:
	/bin/rm -f $(OBJ)

fclean: clean
	/bin/rm -f $(NAME)

re: fclean all

test: $(OBJ) src/main.c
	$(CC) src/main.c $(LIBS) -o $(NAME_TEST)

clean_test:
	/bin/rm -f $(NAME_TEST)