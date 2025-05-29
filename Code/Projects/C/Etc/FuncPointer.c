#include <stdio.h>
#define SIZE 16

typedef struct
{
  char name[SIZE];
  int age;
}person;

int add(int x, int y)
{
  return x+y;
}

void incrementAge(person *p, int ageToBeIncremented)
{
  p->age+ageToBeIncremented;
  printf("Age has been incrmented to [%d] years\n", p->age);
}


int main(void)
{
  //  int (*aptr) (int, int);
  void (*iptr) (person, int);
  iptr=incrementAge;
  person p={.name="Jhonny", .age=21};
  person *pptr=&p;
  iptr(pptr, 2);
  //  aptr=add;
  //  printf("Result: {%d}\n", aptr(20, 30));
  return 0;
}
