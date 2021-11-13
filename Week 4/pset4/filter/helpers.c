#include "helpers.h"
#include <stdio.h>
#include <math.h>

// Convert image to grayscale
void grayscale(int height, int width, RGBTRIPLE image[height][width])
{
    float avg;

    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            RGBTRIPLE pixel = image[i][j];
            avg = round((pixel.rgbtRed +  pixel.rgbtGreen + pixel.rgbtBlue) / 3.0);
            image[i][j].rgbtRed = image[i][j].rgbtGreen = image[i][j].rgbtBlue = avg;
        }
    }

    return;
}

// Convert image to sepia
void sepia(int height, int width, RGBTRIPLE image[height][width])
{
    int pRed, pGreen, pBlue;

    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            RGBTRIPLE pixel = image[i][j];
            pRed = round(0.393 * pixel.rgbtRed + 0.769 * pixel.rgbtGreen + 0.189 * pixel.rgbtBlue);
            pGreen = round(0.349 * pixel.rgbtRed + 0.686 * pixel.rgbtGreen + 0.168 * pixel.rgbtBlue);
            pBlue = round(0.272 * pixel.rgbtRed + 0.534 * pixel.rgbtGreen + 0.131 * pixel.rgbtBlue);

            if (pRed > 255)
            {
                pRed = 255;
            }

            if (pGreen > 255)
            {
                pGreen = 255;
            }

            if (pBlue > 255)
            {
                pBlue = 255;
            }

            image[i][j].rgbtRed = pRed;
            image[i][j].rgbtGreen = pGreen;
            image[i][j].rgbtBlue = pBlue;
        }
    }
    return;
}

// Reflect image horizontally
void reflect(int height, int width, RGBTRIPLE image[height][width])
{
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < (width / 2); j++)
        {
            RGBTRIPLE temp = image[i][j];
            image[i][j] = image[i][width - (j + 1)];
            image[i][width - (j + 1)] = temp;
        }
    }
    return;
}

// Blur image
void blur(int height, int width, RGBTRIPLE image[height][width])
{
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            int sumRed = 0, sumGreen = 0, sumBlue = 0;
            int avgRed, avgGreen, avgBlue;
            int c = 0;
            
            for (int k = i - 1; k < i + 2; k++)
            {
                for (int m = j - 1; m < j + 2; m++)
                {
                    if(k < 0 || m < 0 || k >= height || m >= width)
                    {
                        continue;
                    }
                    sumRed += image[k][m].rgbtRed;
                    sumGreen += image[k][m].rgbtGreen;
                    sumBlue += image[k][m].rgbtBlue;
                    c++;
                }
            }
            
            image[i][j].rgbtRed = round(sumRed / c);
            image[i][j].rgbtGreen = round(sumGreen / c);
            image[i][j].rgbtBlue = round(sumBlue / c);
        }
    }
    return;
}
