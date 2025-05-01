CC=gcc
CFLAGS=-O3 -pedantic -Wall -Werror -ggdb

all:main

main:	bubbleSort.o
	$(CC) $(CFLAGS) bubbleSort.o -o main

bubbleSort.o:	bubbleSort.c
	$(CC) $(CFLAGS) -c bubbleSort.c

clean:
	rm -rf bubbleSort.o main
