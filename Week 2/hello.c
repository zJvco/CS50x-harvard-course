#include <stdio.h>

int main()
{
    char answer[45];
    printf("What is your name? ");
    scanf("%s", answer);
    printf("Hello %s\n", answer);
    return 0;
}
