CC = gcc
CFLAGS = -O3 -pedantic -Wall -Wextra -ggdb

.PHONY: all clean run

all: main

main: insertionSort.o
	$(CC) $(CFLAGS) insertionSort.o -o main

insertionSort.o: insertionSort.c
	$(CC) $(CFLAGS) -c insertionSort.c

run: all
	./main

clean:
	rm -rf *.o main
