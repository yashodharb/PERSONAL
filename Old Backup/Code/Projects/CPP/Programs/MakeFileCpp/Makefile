CC=g++
CFLAGS=-ggdb -Wall -Werror

all: hello

hello: main.o hello.o
	$(CC) $(CFLAGS) main.o hello.o -o hello

main.o:	main.cpp hello.h
	$(CC) $(CFLAGS) -c main.cpp

hello.o: hello.cpp
	$(CC) $(CFLAGS) -c hello.cpp

clean:
	rm hello.o main.o hello
