#include <stdio.h>

void meow(int n)
{
    for (int i = 0; i < n; i++)
    {
        printf("Meow\n");
    }
}

int main()
{
    meow(5);
    return 0;
}
