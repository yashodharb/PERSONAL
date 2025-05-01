CC=gcc
CFLAGS=-Wall -Werror -pedantic -Wextra -ggdb

all: employee

employee: employee.o
	$(CC) $(CFLAGS) employee.o -o employee

employee.o: employee.c
	$(CC) $(CFLAGS) employee.c -c employee.o

clean:
	rm -rf *~ main.o employee
