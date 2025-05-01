#include <stdio.h>

#define ARRAY_LEN(arr) (sizeof(arr)/sizeof(int))

void swap(int *xp, int *yp){
  int temp=*xp;
  *xp=*yp;
  *yp=temp;
}

void printArray(int array[], int len){
  int i;
  for(i=0; i<len; i++){
    printf("%d\n", array[i]);
  }
}

void bSort(int array[], int len){
  int i;
  int j;

  for(i=0;i<len;i++){
    for(j=0;j<i-1;j++){
      if(array[i]<array[j]){
        swap(&array[i], &array[j]);
      }
    }
  }
}


int main(void){
  int arr[]={29, 72, 13, 19, 28, 22};
  int len=ARRAY_LEN(arr);
  printf("%d\n", len);
  bSort(arr, len);
  printArray(arr, len);
}
