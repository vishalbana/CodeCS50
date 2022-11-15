#include <cs50.h>
#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <stdlib.h>

bool only_digits(string s);

int main(int argc, string argv[])
{
    if(argc == 2 && only_digits(argv[1]))
    {
        string plaintext = get_string("Plaintext:  ");
        int key = atoi(argv[1]);
        printf("Ciphertext: ");
        for (int i = 0; i < strlen(plaintext); i++)
        {
            if(isupper(plaintext[i]))
            {
                printf("%c",(plaintext[i] - 65 + key)% 26 + 65);
            }
            else if(islower(plaintext[i]))
            {
                printf("%c",(plaintext[i] - 97 + key)% 26 + 97);
            }
            else
            {
                printf("%c",plaintext[i]);
            }

        }

     printf("\n");
     return 0;
    }
    else
    {
        printf("Usage: ./caesar key\n");
        return 1;
    }

    return 1;
}
bool only_digits(string s)
{
    for (int i = 0; i < strlen(s); i++)
    {   char d = s[i];
        if(isdigit(d))
        {
            return true;
        }
        else
        {
            return false;
        }
        }
    return false;
}
