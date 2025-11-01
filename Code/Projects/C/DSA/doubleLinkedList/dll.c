#include <stdio.h>
#include <stdlib.h>

typedef struct node {
    int data;
    struct node *next;
    struct node *prev;
} node;

node* createNode(int data) {
    node* newNode = (node*)malloc(sizeof(node));
    if (!newNode) {
        printf("Memory allocation failed\n");
        exit(1);
    }
    newNode->data = data;
    newNode->next = NULL;
    newNode->prev = NULL;
    return newNode;
}

void insertAtHead(node** head_ref, int data) {
    node* newHeadNode = createNode(data);
    newHeadNode->next = *head_ref;
    newHeadNode->prev = NULL;

    if (*head_ref != NULL)
        (*head_ref)->prev = newHeadNode;

    *head_ref = newHeadNode;
}

void insertAtTail(node** head_ref, int data) {
    node* tailNode = createNode(data);

    if (*head_ref == NULL) {
        *head_ref = tailNode;
        return;
    }

    node* tmp = *head_ref;
    while (tmp->next != NULL)
        tmp = tmp->next;

    tmp->next = tailNode;
    tailNode->prev = tmp;
}

node* search(node* head, int key) {
    node* temp = head;
    while (temp != NULL) {
        if (temp->data == key)
            return temp;
        temp = temp->next;
    }
    return NULL;
}

void deleteNode(node** head_ref, node* del) {
    if (*head_ref == NULL || del == NULL)
        return;

    if (*head_ref == del)
        *head_ref = del->next;

    if (del->next != NULL)
        del->next->prev = del->prev;

    if (del->prev != NULL)
        del->prev->next = del->next;

    free(del);
}

void printDll(node* head) {
    node* temp = head;
    printf("Forward Traversal: ");
    while (temp != NULL) {
        printf("%d ", temp->data);
        if (temp->next == NULL)
            break;
        temp = temp->next;
    }
    printf("\nReverse Traversal: ");
    while (temp != NULL) {
        printf("%d ", temp->data);
        temp = temp->prev;
    }
    printf("\n");
}

void freeList(node* head) {
    node* temp;
    while (head != NULL) {
        temp = head;
        head = head->next;
        free(temp);
    }
}

int main(void) {
    node* head = NULL;

    insertAtHead(&head, 10);
    insertAtHead(&head, 20);
    insertAtTail(&head, 5);
    insertAtTail(&head, 1);

    printDll(head);

    node* n = search(head, 10);
    if (n)
        deleteNode(&head, n);

    printf("After deleting 10:\n");
    printDll(head);

    freeList(head);
    return 0;
}
