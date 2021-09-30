#include <stdio.h>

int main()
{
    int x, y;
    printf("x: ");
    scanf("%i", &x);
    printf("y: ");
    scanf("%i", &y);

    if (x < y)
    {
        printf("x is less than y\n");
    }
    else if (x > y)
    {
        printf("x is greater than y\n");
    }
    else
    {
        printf("x is equal than y\n");
    }

    return 0;
}
