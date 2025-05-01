CC=gcc
CFLAGS= -O3 -ggdb -Wall -Wextra -pedantic

all:	main

main:	selectionSort.o
	$(CC) $(CFLAGS) selectionSort.o -o main

selectionSort.o:	selectionSort.c
	$(CC) $(CFLAGS) -c selectionSort.c

clean:
	rm -rf *.o main
