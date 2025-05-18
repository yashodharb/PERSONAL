#include <stdio.h>

#define ArrayLength(array) sizeof(array)/sizeof(int)

void selectionSort(int array[], int len){
  int i;
  int j;
  int key;

  for(i=1; i<len; i++){
    key=array[i];
    j=i-1;

    while(j>=0 && array[j]>key){
      array[j+1]=array[j];
      j=j-1;
    }
    array[j+1]=key;
  }
}

void printArray(int array[], int len){
  int i;
  for(i=0; i<len; i++){
    printf("%d\n", array[i]);
  }
}


int main(void){
  int array[]={9, 8, 7, 6, 5, 4, 3, 2, 1};
  int len=ArrayLength(array);
  selectionSort(array, len);
  printArray(array, len);
  return 0;
}
