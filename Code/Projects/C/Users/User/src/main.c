
/*

void save_users_to_file(const char *filename) {
    FILE *fp = fopen(filename, "wb");
    if (!fp) {
        perror("Error opening file for writing");
        return;
    }

    fwrite(&current_user_count, sizeof(int), 1, fp);
    fwrite(user_array, sizeof(User_s), user_count, fp);
    fclose(fp);
}

 */

/*

// Load all users from file
void load_users_from_file(const char *filename) {
    FILE *fp = fopen(filename, "rb");
    if (!fp) {
        // File may not exist yet — that's okay
        return;
    }

    fread(&current_user_count, sizeof(int), 1, fp);
    fread(user_array, sizeof(User_s), usercount, fp);
    fclose(fp);
}

 */

#include <stdarg.h>
#include <stdio.h>
#include <string.h>

#define SIZE 32
#define MAX_CAP 10

typedef struct {
    char name[SIZE];
    char email[SIZE];
    char gender;
} Basic_userinfo_s;

typedef struct {
    char username[SIZE];
    char password[SIZE];
    Basic_userinfo_s userinfo;
} User_s;

/* GLOBALs */
User_s user_array[MAX_CAP];
int current_user_count = 0;


void remove_newline(char *string) {
    int index = strcspn(string, "\n");
    string[index] = '\0';
}

void create_User() {
   if (current_user_count >= MAX_CAP) {
        printf("User limit has been reached!\n");
        return;
    }

    User_s User;

    printf("Name: ");
    fgets(User.userinfo.name, sizeof(User.userinfo.name), stdin);
    remove_newline(User.userinfo.name);

    printf("Email: ");
    fgets(User.userinfo.email, sizeof(User.userinfo.email), stdin);
    remove_newline(User.userinfo.email);

    char gender_input[SIZE];
    printf("Please specify the gender (M/F/O): ");
    fgets(gender_input, sizeof(gender_input), stdin);
    remove_newline(gender_input);
    User.userinfo.gender = gender_input[0];  // take only the first character

    printf("Please enter a username: ");
    fgets(User.username, sizeof(User.username), stdin);
    remove_newline(User.username);

    printf("Please enter a password: ");
    fgets(User.password, sizeof(User.password), stdin);
    remove_newline(User.password);

    user_array[current_user_count] = User;
    current_user_count++;

    printf("\nUser has been created successfully!\n");
}

int main(void) {
    create_User();

    printf("\n--- User Info ---\n");
    printf("Name: %s\n", user_array[0].userinfo.name);
    printf("Email: %s\n", user_array[0].userinfo.email);
    printf("Gender: %c\n", user_array[0].userinfo.gender);
    printf("Username: %s\n", user_array[0].username);
    printf("Password: %s\n", user_array[0].password);

    return 0;
}
