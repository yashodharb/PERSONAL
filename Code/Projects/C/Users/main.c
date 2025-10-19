#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_SIZE 32

typedef struct {
    char name[16];
    char password[16];
} Person;

Person people[MAX_SIZE];
int usercount = 0;

void remove_newline(char *string) {
    int index = strcspn(string, "\n");
    string[index] = '\0';
}

// Save all users to a file
void save_users_to_file(const char *filename) {
    FILE *fp = fopen(filename, "wb");
    if (!fp) {
        perror("Error opening file for writing");
        return;
    }

    fwrite(&usercount, sizeof(int), 1, fp);
    fwrite(people, sizeof(Person), usercount, fp);
    fclose(fp);
}

// Load all users from file
void load_users_from_file(const char *filename) {
    FILE *fp = fopen(filename, "rb");
    if (!fp) {
        // File may not exist yet — that's okay
        return;
    }

    fread(&usercount, sizeof(int), 1, fp);
    fread(people, sizeof(Person), usercount, fp);
    fclose(fp);
}

// Create new user
void create_user() {
    if (usercount >= MAX_SIZE) {
        printf("Users Limit Reached!!\n");
        return;
    }

    Person p;
    printf("Username: ");
    fgets(p.name, sizeof(p.name), stdin);
    remove_newline(p.name);

    // Check if user already exists
    for (int i = 0; i < usercount; i++) {
        if (strcmp(people[i].name, p.name) == 0) {
            printf("User already exists.\n");
            return;
        }
    }

    printf("Password: ");
    fgets(p.password, sizeof(p.password), stdin);
    remove_newline(p.password);

    people[usercount++] = p;
    printf("User '%s' created successfully.\n", p.name);
}

// Check user info
void get_user_info(char *name) {
    for (int i = 0; i < usercount; i++) {
        if (strcmp(people[i].name, name) == 0) {
            printf("User Found: %s\n", people[i].name);
            printf("Password: %s\n", people[i].password);
            return;
        }
    }

    printf("User not found.\n");
}

// Main menu
int main(void) {
    load_users_from_file("users.dat");

    int choice;
    char name[16];

    printf("Please choose an option:\n");
    printf(" 1] Check User Information\n");
    printf(" 2] Create User\n");
    printf(" 3] Update User (TO-DO)\n");
    printf(" 4] Delete User (TO-DO)\n");
    printf("Enter your choice: ");
    scanf("%d", &choice);
    getchar();  // Consume leftover newline

    switch (choice) {
        case 1:
            printf("Enter username to search: ");
            fgets(name, sizeof(name), stdin);
            remove_newline(name);
            get_user_info(name);
            break;

        case 2:
            create_user();
            break;

        case 3:
            printf("Update User TO-BE implemented!\n");
            break;

        case 4:
            printf("Delete User TO-BE implemented!\n");
            break;

        default:
            printf("Invalid choice.\n");
            break;
    }

    save_users_to_file("users.dat");
    return 0;
}
