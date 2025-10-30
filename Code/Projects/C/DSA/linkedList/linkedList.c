#include <signal.h>
#include <stdio.h>
#include <stdnoreturn.h>
#include <string.h>
#include <stdlib.h>


typedef struct node
{
    int data;
    struct node *next;
}node;

node *head = NULL;
node *current = NULL;

void print_ll()
{
    node *p = head;
    printf("\n[");

    while(p!=NULL){
        printf(" %d ", p->data);
        p = p->next;
    }
    printf("]");
}

void insert_begin(int data)
{
    node *first_node = (node *)malloc(sizeof(node));
    first_node->data = data;
    first_node->next = head;

    head = first_node;
}

void insert_end(int data)
{
    node *last_node = (node *)malloc(sizeof(node));
    last_node->data = data;
    last_node->next = NULL;

    if(head==NULL){
        head=last_node;
        return;
    }
    
    node *link = head;

    while(link->next!=NULL){
        link = link->next;
    }
    link->next=last_node;
}

void insert_POS(node *linked_list, int data)
{
    if(linked_list == NULL){
        printf("Error: given position is NULL\n");
        return;
    }
    node *arbitary = (node *)malloc(sizeof(node));
    arbitary->data = data;
    arbitary->next = linked_list->next;
    linked_list->next = arbitary;
}

int main(void)
{
    insert_begin(10);
    insert_POS(head, 25);
    insert_end(26);

    print_ll();
    return 0;
}
