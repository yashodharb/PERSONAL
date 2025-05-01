#include <stdio.h>
#include <stdlib.h>

struct Node{
  int data;
  struct Node *nextNode;
};

struct Node *createNode(int data){
  struct Node *newNode=(struct Node*)malloc(sizeof(struct Node)); //Allocating Memory for linkedList;
  newNode->data=data;
  newNode->nextNode=NULL; //Since this is a new Node, it wont point to next address and hence Null;
  return newNode; //Return the new node;
}

void Inserthead(struct Node **head, int data){
  struct Node *newNode=createNode(data); 
  newNode->nextNode=*head; //Pointing to the HeadNodeValue
  *head=newNode;
}

void InsertEnd(struct Node **head, int data){
  struct Node *newNode=createNode(data);
  if(*head==NULL){*head=newNode;}
}

int main(void){
  int a=10;
  int *pa=&a;
  int **pA=&pa;
  printf("%d\n", **pA);
  
}
