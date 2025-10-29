#include <assert.h>
#include <stdio.h>
#include <string.h>

#define CAP 32

/* Using length as the key. ROT13: use any key this is just a demonstration purpose */

void encrypt(char password[])
{
  int key = strlen(password);
  int sum;
  for(int i=0; i<key; i++){
    password[i] = password[i]+key;
    }
}

void decrypt(char _enc_pass[])
{
  int key = strlen(_enc_pass);
  int sum;
  for(int i=0; i<key; i++){
    _enc_pass[i] = _enc_pass[i]-key;
    }
}

int main(void){
  char password[CAP] = "wtf";
  encrypt(password);
  printf("Encrypted: %s\n", password);
  
  decrypt(password);
  printf("Decrypted: %s\n", password);
  return 0;
}
