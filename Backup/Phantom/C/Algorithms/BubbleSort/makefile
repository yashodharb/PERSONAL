CC=gcc
CFLAGS=-O3 -pedantic -Wall -Wextra -ggdb

all:	main

main:	bubble.o
	$(CC) $(CFLAGS) bubble.o -o main

bubble.o:	bubble.c
	$(CC) $(CFLAGS) -c bubble.c

clean:
	rm -rf *.o main
