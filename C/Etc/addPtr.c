#include <stdio.h>
#include <stdlib.h>

int *add(int *a, int *b)
{
 int *result=(int *)malloc(sizeof(int));
 *result =*a+*b;
 return result;
}

int main(void)
{
  int a=10;
  int b=21;
  int *ans=add(&a, &b);
  printf("%d", *ans);
}
