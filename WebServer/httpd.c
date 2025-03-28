/* httpd.c */

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <netinet/in.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <sys/types.h>

#define LISTENADDR "0.0.0.0" // [Accessible all over the internet]

/* Global */
char *error;


/* Returns -1 on error, else returns socket FD */

int srv_init(int portno)
{
  int s = socket(AF_INET, SOCK_STREAM, 0); //Create a socket which will return the FD. FD is an integer value.
  struct sockaddr_in srv; //Generic sockaddr_in struct [man socker -> Linux]
  
  if(s<0)
  {
	error="Socket() creation failed";
	return -1; //Return when failed to create a socket
  }
  // return 0;
  memset(&srv, 0, sizeof(srv));
  srv.sin_family=AF_INET;
  srv.sin_addr.s_addr=inet_addr(LISTENADDR);
  srv.sin_port=htons(portno);

  if( bind(s, (struct sockaddr *)&srv, sizeof(srv))) //Binding the socket
	{
	  close(s);
	  error="Bind() error";
	  return -1;
	}

  if(listen(s, 5)) //Listening to the socket
	{
	  close(s);
	  error="Lisening error";
	  return -1;
	}

  return s;  //Returning the socket
}


/* Returns -1 on error or returns new-clients fd */

int cli_conn(int s, int c)
{
    char buffer[1024];
    ssize_t bytes_read;

    while ((bytes_read = read(c, buffer, sizeof(buffer) - 1)) > 0) {
        buffer[bytes_read] = '\0';  // Null-terminate the string
        printf("Received: %s\n", buffer);
        write(c, buffer, bytes_read);  // Echo the data back to the client
    }

    if (bytes_read < 0) {
	  perror("Read Error occured");
	  return -1;
}
	return 0;
}

int cli_accept(int s)
{
  int c;
  socklen_t addrlen;

  struct sockaddr_in cli;

  addrlen=0;
  memset(&cli, 0, sizeof(cli));
  c= accept(s, (struct sockaddr *)&cli, &addrlen);
  if(c<0)
  {
	error="Client Accept error";
	fprintf(stderr, "%s\n", error);
  }
  return c;
}
 
int main(int argc, char *argv[])
{
  int s, c;
  char *port;

  if(argc<2)
  {
	fprintf(stderr, "Usage %s <Listening Port>\n", argv[0]);
  }

  port=argv[1];
  s=srv_init(atoi(port));

  if(!s)
  {
	fprintf(stderr, "%s\n", error);
	return -1;
  }
  printf("Lisening on %s:%d", LISTENADDR, atoi(port));
  
  while(1)
  {
	c = cli_accept(s);
	if(!c)
	{
	  fprintf(stderr, "%s\n", error);
	  continue;
	}
	printf("Incoming Connection\n");
	if(!fork())
	{
	  close(s);
	  cli_conn(s, c);
	  close(c);
	  exit(0);
	}
  }
  return 0;
}

