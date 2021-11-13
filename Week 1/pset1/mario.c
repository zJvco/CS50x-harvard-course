#include <stdio.h>
#include <cs50.h>
#include <string.h>

int main(void)
{
    int height;
    
    do
    {
        height = get_int("Height: ");
    } while (height < 1 || height > 8);
    
    // Create Map
    for (int i = 0; i < height; i++)
    {
        // Printing white spaces
        for (int j = (height - 2) - i; j >= 0; j--)
        {
            printf(" ");
        }
        
        // Left of map
        for (int left = 0; left <= i; left++)
        {
            printf("#");
        }
        
        printf("  ");
        
        // Right of map
        for (int right = 0; right <= i; right++)
        {
            printf("#");
        }
        printf("\n");
    }

    return 0;
}