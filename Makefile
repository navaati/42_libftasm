NAME = libfts.a
OBJS = part1.o part2.o part3.o

AS = $(HOME)/.brew/bin/nasm
ASFLAGS = -f macho64

all: $(NAME)

$(NAME): $(OBJS)
	ar rcs $@ $+

fclean: clean
	rm -f $(NAME)

clean:
	rm -f $(OBJS)

re:
	$(MAKE) fclean
	$(MAKE) all
