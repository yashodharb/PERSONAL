#include <stdio.h>


#define max_size 256

typedef struct
{
  char name[max_size];
  int age;
}person;

person createPerson(person *p)
{
  printf("Enter Name: \n");
  scanf("%s", &p->name);

  printf("Enter age: \n");
  scanf("%d", &p->age);

  return *p;
}  


int main(void)
{
 person p_array[20];

 person p = createPerson(&p);
 return 0;

}
