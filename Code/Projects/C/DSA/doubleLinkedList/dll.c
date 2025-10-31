#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>

typedef struct node
{
    int data;
    struct node *next;
    struct node *prev;
}node;

node *head = NULL;              /* Will point to the head always */
node *tail = NULL;              /* Will point to the tail always */
node *current = NULL;           /* Will be used to traverse the dll */

node *createNode(int data)
{
    node *initial_node = (node *)malloc(sizeof(node));
    if(initial_node==NULL){
        printf("Not enough memory\n");
        exit(1);
    }
    initial_node->data = data;
    initial_node->prev = NULL;
    initial_node->next = NULL;
    return initial_node;
}

void printDll(node* head) {
    node* temp = head;
    printf("Forward Traversal: ");
 while (temp != NULL) {
        printf("%d ", temp->data); // Print the data in each node
        if (temp->next == NULL) {
            break;  // Stop when we reach the last node
        }
        temp = temp->next;  // Move to the next node
    }
    printf("\n");

    // Call the reverse traversal function starting from the last node
    printf("Reverse Traversal: ");
    while (temp != NULL) {
        printf("%d ", temp->data); // Print the data in each node
        temp = temp->prev;         // Move to the previous node
    }
    printf("\n");
}

void freeList(node* head) {
    node* temp;
    while (head != NULL) {
        temp = head;         // Store the current node
        head = head->next;   // Move to the next node
        free(temp);          // Free the current node
    }
}

int main(void)
{
        // Create nodes
    node* node1 = createNode(10);  // First node
    node* node2 = createNode(20);  // Second node
    node* node3 = createNode(30);  // Third node

    // Link nodes
    node1->next = node2;
    node2->prev = node1;
    node2->next = node3;
    node3->prev = node2;

    // Print the list with forward and reverse traversal
    printDll(node1);

    // Free allocated memory
    freeList(node1);
    
    return 0;
}
