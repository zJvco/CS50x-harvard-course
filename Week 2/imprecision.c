#include <stdio.h>

int main()
{
    float x, y;
    printf("x: ");
    scanf("%f", &x);
    printf("y: ");
    scanf("%f", &y);
    printf("%.50f\n", x / y);
    return 0;
}
