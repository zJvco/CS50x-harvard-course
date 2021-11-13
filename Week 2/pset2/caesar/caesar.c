#include <stdio.h>
#include <cs50.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

int main(int argc, string argv[]) {
    if (argc != 2) {
        printf("Usage: ./caesar key\n");
        return 1;
    }
    
    for (int i = 0, n = strlen(argv[1]); i < n; i++) {
        if (argv[1][i] < 48 || argv[1][i] > 57) {
            printf("Usage: ./caesar key\n");
            return 1;
        }
    }
    
    int k = atoi(argv[1]);
    string plaintext = get_string("plaintext: ");
    
    char *ciphertext;
    ciphertext = malloc(sizeof(char) * strlen(plaintext));
    
    for (int i = 0, n = strlen(plaintext); i < n; i++) {
        int asc = islower(plaintext[i]) ? 97 : (isupper(plaintext[i]) ? 65 : (int) plaintext[i]);
        
        if (asc == 97 || asc == 65) {
            int c = ((plaintext[i] - asc) + k) % 26;
            ciphertext[i] = (char) asc + c;
        }
        else {
            ciphertext[i] = plaintext[i];
        }
    }

    printf("ciphertext: %s\n", ciphertext);

    return 0;
}