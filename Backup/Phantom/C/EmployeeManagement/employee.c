#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define SIZE 16

typedef struct
{
  char name[SIZE];
  int employeeID;
  char department[SIZE];
  int salary;
} EMPLOYEE;

void remove_newline(char *str) {
    // Remove the newline character if present at the end of the string
    size_t len = strlen(str);
    if (len > 0 && str[len - 1] == '\n') {
        str[len - 1] = '\0';
    }
}

int create_Emp(EMPLOYEE *emp)
{
  printf("Enter Employee Name: \n");
  fgets(emp->name, SIZE, stdin);
  remove_newline(emp->name);  // Remove the newline from name

  printf("Enter Department: \n");
  fgets(emp->department, SIZE, stdin);
  remove_newline(emp->department);  // Remove the newline from department

  printf("Enter Employee ID: \n");
  scanf("%d", &emp->employeeID);

  printf("Enter Salary: \n");
  scanf("%d", &emp->salary); 
  
  getchar();  // Consume the leftover newline character
  printf("\nEmployee Created Successfully!\n\n");  // Confirmation message
  return 0;
}

int view_Emp(EMPLOYEE *emp)
{
  printf("\nEmployee Information:\n");
  printf("Name      : %s\n", emp->name);
  printf("ID        : %d\n", emp->employeeID);
  printf("Department: %s\n", emp->department);
  printf("Salary    : %d\n\n", emp->salary);

  return 0;
}

int delete_Emp(EMPLOYEE *emp)
{
  free(emp);
  printf("Employee Record Deleted!\n\n");
  return 0;
}

int main(void)
{
  EMPLOYEE **employees = NULL;  // Array of pointers to EMPLOYEE
  int numEmployees = 0;  // To track the number of employees
  int maxEmployees = 0;  // Max number of employees we can hold in memory
  int choice;
  
  while (1)
  {    
    printf("Welcome to Employee Management System\n");
    printf("Choose the below option:\n");
    printf("1] Create Employee\n");
    printf("2] View Employees\n");
    printf("3] Delete Employee\n");
    printf("4] Exit\n");

    scanf("%d", &choice);
    getchar();  // Consume the leftover newline after scanf

    switch (choice)
    {
    case 1: // Create a new employee
      if (numEmployees == maxEmployees) {
        maxEmployees += 1;  // Expand the size of the array
        employees = realloc(employees, maxEmployees * sizeof(EMPLOYEE *));
        if (employees == NULL) {
          printf("Memory allocation failed!\n");
          return -1;
        }
      }

      employees[numEmployees] = (EMPLOYEE *)malloc(sizeof(EMPLOYEE));
      if (employees[numEmployees] == NULL) {
        printf("Employee Creation Failed!\n");
        return -1;
      }

      create_Emp(employees[numEmployees]);  // Create employee
      numEmployees++;  // Increment number of employees
      break;
      
    case 2: // View all employees
      if (numEmployees == 0) {
        printf("\nNo Employees Created!\n\n");
      } else {
        printf("\n--- Employee List ---\n");
        for (int i = 0; i < numEmployees; i++) {
          printf("Employee %d:\n", i + 1);
          view_Emp(employees[i]);
        }
      }
      break;

    case 3: // Delete an employee
      if (numEmployees == 0) {
        printf("\nNo Employees to Delete!\n\n");
      } else {
        int employeeIndex;
        printf("\nEnter the index of the employee to delete (1 to %d): ", numEmployees);
        scanf("%d", &employeeIndex);
        getchar();  // Consume the newline character

        if (employeeIndex < 1 || employeeIndex > numEmployees) {
          printf("\nInvalid index!\n\n");
        } else {
          free(employees[employeeIndex - 1]);  // Free the memory for the employee
          for (int i = employeeIndex - 1; i < numEmployees - 1; i++) {
            employees[i] = employees[i + 1];  // Shift employees down
          }
          numEmployees--;  // Decrease the employee count
          printf("\nEmployee Deleted!\n\n");
        }
      }
      break;

    case 4:  // Exit the program
      for (int i = 0; i < numEmployees; i++) {
        free(employees[i]);  // Free memory for each employee
      }
      free(employees);  // Free the array itself
      printf("Exiting the program.\n");
      return 0;  // Exit the program gracefully

    default:
      printf("\nInvalid Choice! Please select a valid option.\n\n");
      break;
    }    
  }
  return 0;
}
