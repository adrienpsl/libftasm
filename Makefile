NAME = libfts.a

T_NAME = test_libfts

SRCSDIR = src/

OBJSDIR = objs/

SRCS = 	ft_bzero.asm \
		ft_isalnum.asm \
		ft_isalpha.asm \
		ft_isascii.asm \
		ft_isdigit.asm \
		ft_isprint.asm \
		ft_memcpy.asm \
		ft_memset.asm \
		ft_puts.asm \
		ft_strdup.asm \
		ft_strlen.asm \
		ft_tolower.asm \
		ft_toupper.asm \
		ft_strcat.asm \
		ft_cat.asm

OBJS = $(addprefix $(OBJSDIR),$(SRCS:.asm=.o))

$(OBJSDIR)%.o: $(SRCSDIR)%.asm Makefile
	mkdir -p $(OBJSDIR)
	nasm -f macho64 -o $@ $<

all: $(NAME)

$(NAME): $(OBJS)
	ar rc $(NAME) $(OBJS)
	ranlib $(NAME)

test: $(NAME)
	gcc -o $(T_NAME) src/test.c  -I includes/ -L./ -lfts
	./$(T_NAME)

clean:
	rm -rf $(OBJSDIR)

fclean: clean
	rm -rf $(NAME)
	rm -rf $(T_NAME)

re: fclean all

#test: $(OBJ) src/main.c
#	$(CC) src/main.c $(LIBS) -o $(NAME_TEST)

clean_test:
	/bin/rm -f $(NAME_TEST)

.PHONY: all clean fclean re
