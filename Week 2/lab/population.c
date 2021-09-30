#include <stdio.h>

int main()
{
    int x, y, n = 0;
    
    do
    {
        printf("Start size: ");
        scanf("%i", &x); 
    } while (x < 9);
    
    do
    {
        printf("End size: ");
        scanf("%i", &y); 
    } while (y < x);
    
    do
    {
        x = x + (x / 3) - (x / 4);
        n++;
    } while (x < y);
    
    printf("Years: %i\n", n);
    return 0;
}