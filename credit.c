#include <cs50.h>
#include <stdio.h>

int main(void)

{
   long long credit_card_number;
   do
{
   credit_card_number = get_long_long("Please enter your credit card number: ");
}
   while (credit_card_number < 1);
   long long temp;

   int sum1 = 0, sum2 = 0, counter = 1, n, total;
   temp = credit_card_number;
   do
{
    n = temp % 10;
    if (counter % 2 == 0)
    {
    n = n * 2;
    if (n > 9)
{
    n = n - 9;
}
    sum1 += n;
    }
    else
    {
        sum2 += n;
    }
    counter++;
    temp = temp / 10;
}
    while (temp > 0);
    total = sum1 + sum2;
    if (total % 10 == 0)
{
    temp = credit_card_number;
    do
    {
        temp = temp / 10;
    }
    while (temp < 10 || temp > 100);

    if (((counter - 1) == 15) && (temp == 34 || temp == 37))
    {                                                         
        printf("AMEX\n");
    }
    else if (((counter - 1) == 16) && (temp >= 51 && temp <= 55))
    {
        printf("MASTERCARD\n");
    }
    else if ((((counter - 1) == 13) || ((counter - 1) == 16)) && (temp / 10 == 4))
    {
        printf("VISA\n");
    }
    else
    {
        printf("INVALID\n");
    }
}
    else
    {
    printf("INVALID\n");
    }
}