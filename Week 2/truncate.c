#include <stdio.h>

int main()
{
    float x, y, z;
    printf("x: ");
    scanf("%f", &x);
    printf("y: ");
    scanf("%f", &y);
    
    z = x / y;
    printf("%f\n", z);
    return 0;
}
