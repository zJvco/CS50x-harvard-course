#include <stdio.h>
#include <cs50.h>
#include <math.h>

// cash (1$, 5%, 10$, 25$)

int main(void)
{
    int cash;
    
    do
    {
        cash = round(get_float("Cash: ") * 100);
    } while(cash < 0);
    
    int coins = 0;
    
    while (cash > 0)
    {
        if (cash < 5) {
            cash -= 1;
        } else if (cash < 10) {
            cash -= 5;
        } else if (cash < 25) {
            cash -= 10;
        } else if (cash >= 25) {
            cash -= 25;
        }
        coins++;
    }
    
    printf("%d\n", coins);
    
    return 0;
}