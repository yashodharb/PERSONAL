CC = gcc
CFLAGS =-O3 -pedantic -Wall -Werror -ggdb

all: calculator

calculator: main.o add.o
	$(CC) $(CFLAGS) main.o add.o -o calculator

main.o: main.c add.h
	$(CC) $(CFLAGS) -c main.c

add.o: add.c add.h
	$(CC) $(CFLAGS) -c add.c

clean:
	rm -f main.o add.o  calculator
