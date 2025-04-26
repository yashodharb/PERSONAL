CC=gcc
CFLAGS= -ggdb -Wall 


all: httpd

httpd:httpd.o
	$(CC) $(CFLAGS) httpd.o -o httpd

httpd.o: httpd.c
	$(CC) $(CFLAGS) -c httpd.c -o httpd.o

clean:
	rm -rf httpd.o httpd
