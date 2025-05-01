#include <stdio.h>

void swap(int *i, int *j){
  int temp=*i;
  *i=*j;
  *j=temp;
}


void bubbleSort(int arr[], int len){
  int i, j;
  for(i=0; i<len-1; i++){
    for(j=i+1;j<len;j++){
      if(arr[j]<arr[i]){
        swap(&arr[j], &arr[i]);
      }
    }
  }
}

void printArr(int arr[], int len){
  for(int i=0; i<len; i++){
    printf("%d\n", arr[i]);
  }
}

int main(void){
  int arr[]={21, 23, 11, 54, 1, 9};
  //int arr[]={9, 7, 6, 5, 4, 3, 2, 1};
  int len=sizeof(arr)/sizeof(int);
  bubbleSort(arr, len);
  printArr(arr, len);
}
