#include <stdio.h>
#include <cs50.h>
#include <string.h>
#include <math.h>

int words_counter(string txt)
{
    int c = 1;
    for (int i = 0; i < strlen(txt); i++)
    {
        if (txt[i] == 32)
        {
            c++;
        }
    }
    return c;
}

int letters_counter(string txt)
{
    int c = 0;
    for (int i = 0; i < strlen(txt); i++)
    {
        if ((txt[i] >= 97 && txt[i] <= 122) || (txt[i] >= 97 - 32 && txt[i] <= 122 - 32))
        {
            c++;
        }
    }
    return c;
}

int sentences_counter(string txt)
{
    int c = 0;
    for (int i = 0; i < strlen(txt); i++)
    {
        if (txt[i] == 46 || txt[i] == 33 || txt[i] == 63)
        {
            c++;
        }
    }
    return c;
}

int calculate_readability(float lc, float wc, float sc)
{
    float l = (lc / wc) * 100;
    float s = (sc / wc) * 100;
    float index = 0.0588 * l - 0.296 * s - 15.8;
    return round(index);
}

int main()
{   
    string text = get_string("Type your text here: ");
    
    float lc = letters_counter(text), wc = words_counter(text), sc = sentences_counter(text);
    int ra = calculate_readability(lc, wc, sc);
    
    if (ra < 1)
    {
        printf("Before Grade 1\n");
    }
    else if (ra >= 16)
    {
        printf("Grade 16+\n");
    }
    else
    {
        printf("Grade %d\n", ra);
    }
    
    return 0;
}

