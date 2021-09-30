#include <stdio.h>

int get_positive_int(void)
{
    int n;
    do
    {
        scanf("%i", &n);
    } while (n < 1);
    return n;
}

int main()
{
    int i = get_positive_int();
    printf("%i\n", i);
    return 0;
}
