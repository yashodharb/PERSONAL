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
  FILE* file = fopen("hashes.txt", "w");
  if(file!=NULL)
  {
    for(int i=0; i<length; i++)
      {
	hash_value+=name[i]%TABLE_SIZE;
	//	printf("%d", hash_value);
      }
    	fprintf(file, "%d", hash_value);
	fclose(file);
  }
  else
  {
   printf("error!");
  }
  return hash_value;
}

int main(void)
{
  char *name="yash";
  hash(name);
  return 0;
}
