#include <stdio.h>

int main()
{
    char c;
    scanf("%c", &c);

    if (c == 'y' || c == 'Y')
    {
        printf("Agreed\n");
    }
    else if (c == 'n' || c == 'N')
    {
        printf("Not agreed\n");
    }
    return 0;
}
