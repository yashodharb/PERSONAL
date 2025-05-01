#include <stdio.h>
#include <stdlib.h>

int main(void){
  int *ptr;
  int size=5;
  int i;
  int j;
  ptr=(int*)malloc(size*sizeof(int));

  if(ptr!=NULL){printf("Memory Allocation Successfully!\n");
    for(i=0; i<size; i++){ptr[i]=i;}
    for(j=0; j<size; j++){printf("%d\n", ptr[j]);}
    free(ptr);
  }
  else{printf("Error allocating the memory!\n");}
}

