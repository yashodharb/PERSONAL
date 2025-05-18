#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdint.h>
#include <string.h>

#define SIZE 256
#define TABLE_SIZE 10

unsigned int hash(char *name)
{
  int length = strlen(name);
  unsigned int hash_value=0;
  for(int i=0; i<length; i++)
  {
    hash_value=(hash_value+name[i]*length)%TABLE_SIZE;
    
  }
  return hash_value;
}

int main(void)
{
  printf("%u\n", hash("john"));
  printf("%u\n", hash("Ayesha"));
  printf("%u\n", hash("Michael"));
  printf("%u\n", hash("Alena"));
  printf("%u\n", hash("Joshua"));
  printf("%u\n", hash("Haylene"));
  printf("%u\n", hash("Marcus"));
  return  0;
}
