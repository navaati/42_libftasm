NAME = libfts.a
OBJS = char.o buf.o io.o

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

test: $(NAME)
	opentester run $<
