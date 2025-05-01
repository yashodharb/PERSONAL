CC=gcc
CFLAGS=-ggdb -Wall -Werror

all: hello

hello: main.o hello.o
	@$(CC) $(CFLAGS) main.o hello.o -o hello

main.o:	main.c
	@$(CC) $(CFLAGS) -c main.c

hello.o: hello.c
	@$(CC) $(CFLAGS) -c hello.c

clean:
	@rm -rf *.o hello
