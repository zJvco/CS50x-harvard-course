#include <cs50.h>
#include <stdio.h>

int main()
{
    int x, y, n = 0;
    
    do
    {
        x = get_int("Start size: "); 
    } while (x < 9);
    
    
    do
    {
        y = get_int("End size: ");
    } while (y < x);
    
    
    do
    {
        x = x + (x / 3) - (x / 4);
        n++;
    } while (x < y);
    
    printf("Years: %i\n", n);
    return 0;
}