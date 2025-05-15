#include <stdio.h>

#define ARRAY_LENGTH(array) (sizeof(array) / sizeof((array)[0]))

void swap(int *i, int *j){
  int temp;
  temp=*i;
  *i=*j;
  *j=temp;
}

void printArray(int array[], int len){
  int i;
  for(i=0; i<len; i++){
    printf("%d\n", array[i]);
  }
}

void selectionSort(int array[], int len){
  int i;
  int j;
  int min_index;
  for(i=0; i<len-1; i++){
    min_index=i;
    for(j=i+1; j<len; j++){
      if(array[j]<array[min_index]){
        min_index=j;
      }
    }
    if(min_index!=i){
      swap(&array[min_index], &array[i]);
    }
  }
}

int main(void){
  int array[]={9, 3, 4, 1, 2, 7, 5, 8, 6};
  int len=ARRAY_LENGTH(array);
  selectionSort(array, len);
  printArray(array, len);
  return 0;
}
