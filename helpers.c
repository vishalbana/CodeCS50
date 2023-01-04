#include "helpers.h"
#include <math.h>

// Convert image to grayscale
void grayscale(int height, int width, RGBTRIPLE image[height][width])
{
    for(int i = 0; i < height; i++)
    {
        for(int j = 0; j < width; j++)
        {
            float blue = image[i][j].rgbtBlue;
            float green = image[i][j].rgbtGreen;
            float red = image[i][j].rgbtRed;

            int average = round((blue + green + red) / 3);
            image[i][j].rgbtBlue = image[i][j].rgbtGreen = image[i][j].rgbtRed = average;
        }
    }
    return;
}

// Convert image to sepia
void sepia(int height, int width, RGBTRIPLE image[height][width])
{
    for(int i = 0; i < height; i++)
    {
        for(int j = 0; j < width; j++)
        {
            float originalRed = image[i][j].rgbtRed;
            float originalGreen = image[i][j].rgbtGreen;
            float originalBlue = image[i][j].rgbtBlue;

            int sepiaRed = round(.393 * originalRed + .769 * originalGreen + .189 * originalBlue);
            int sepiaGreen = round(.349 * originalRed + .686 * originalGreen + .168 * originalBlue);
            int sepiaBlue = round(.272 * originalRed + .534 * originalGreen + .131 * originalBlue);
            if(sepiaRed > 255)
            {
                sepiaRed = 255;
            }
            if(sepiaGreen > 255)
            {
                sepiaGreen = 255;
            }
            if(sepiaBlue > 255)
            {
                sepiaBlue = 255;
            }
            image[i][j].rgbtRed = sepiaRed;
            image[i][j].rgbtGreen = sepiaGreen;
            image[i][j].rgbtBlue = sepiaBlue;
        }
    }
    return;
}

// Reflect image horizontally
void reflect(int height, int width, RGBTRIPLE image[height][width])
{
    for(int i = 0; i < height; i++)
    {
        for(int j = 0; j < width / 2; j++)
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
  RGBTRIPLE copy[height][width];
  for(int i = 0; i < height; i++)
     {
        for(int j = 0; j < width; j++)
        {
            copy[i][j] = image[i][j];
        }
     }

 for(int i = 0; i < height; i++)
   {
        for(int j = 0; j < height; j++)
        {
            int Red = 0, Blue = 0, Green = 0;
            float counter = 0;

            for(int x = -1; x < 2; x++)
            {
                for(int y = -1; y <2; y++)
                {
                    int newx = i + x;
                    int newy = j + y;

                    if(newx < 0 || newx > (height-1) || newy < 0 || newy > (width-1))
                    {
                        continue;
                    }

                    Red += image[newx][newy].rgbtRed;
                    Green += image[newx][newy].rgbtGreen;
                    Blue += image[newx][newy].rgbtBlue;

                    counter++;
                }

                copy[i][j].rgbtRed = round(Red / counter);
                copy[i][j].rgbtGreen = round(Green / counter);
                copy[i][j].rgbtBlue = round(Blue / counter);
            }
        }
   }

   for(int i = 0; i < height; i++)
   {
      for(int j = 0; j < width; j++)
      {
        image[i][j].rgbtRed = copy[i][j].rgbtRed;
        image[i][j].rgbtGreen = copy[i][j].rgbtGreen;
        image[i][j].rgbtBlue = copy[i][j].rgbtBlue;
      }
   }
    return;
}
