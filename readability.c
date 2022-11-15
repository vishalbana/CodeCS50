#include <cs50.h>
#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <math.h>

int count_letters(string text);
int count_words(string text);
int count_sentences(string text);
int letters = 0;
int words = 1;
int sentences = 0;

int main(void)
{
    string text = get_string("Text: ");

    count_letters(text);
    count_words(text);
    count_sentences(text);


    float L = (float)letters / (float)words * 100;
    float S = (float)sentences / (float)words * 100;

    int index = round(0.0588 * L - 0.296 * S - 15.8);


     if (index < 1)
    {
        printf("Before Grade 1\n");
    }
    else if (index > 16)
    {
        printf("Grade 16+\n");
    }
    else
    {
        printf("Grade %i\n", index);
    }

}
int count_letters(string text)
{
    for (int i = 0; i < strlen(text); i++)
    {
        if isalpha((text[i]))
        {
            (letters++);
        }
    }
    return letters;
}
int count_words(string text)
{
     for (int i = 0; i < strlen(text); i++)
    {
    if (text[i] == ' ')
    {
        words++;
    }
    }
    return words;
}
int count_sentences(string text)
{
    for (int i = 0; i < strlen(text); i++)
    {
    if (text[i] == '.' || text[i] == '!' || text[i] == '?')
    {
        sentences++;
    }
    }
    return sentences;
}
