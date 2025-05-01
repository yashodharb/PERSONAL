#include <stdio.h>
#include <stdlib.h>

struct s_Student
{
  int id;
  int rollNo;
};

void createStudent(struct s_Student *s)
{
  printf("Student ID: ");
  scanf("%d", &s->id);

  printf("Student rollNo: ");
  scanf("%d", &s->rollNo);
}

void printStudentInfo(struct s_Student *s)
{
  printf("Student id: %d\n", s->id);
  printf("Student Roll No: %d\n", s->rollNo);
}

int main()
{
  struct s_Student **s;
  struct s_Student student;
  int numOfStudents=0;
  int maxStudent=5;
  
  s=(struct s_Student*)malloc(maxStudent*sizeof(struct s_Student));

  createStudent(&student);
  printStudentInfo(&student);
  
  s[0]=student;
  
  return 0;
}
