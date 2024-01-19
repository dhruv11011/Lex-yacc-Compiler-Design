%{
#include<stdio.h>
#include <stdlib.h>
%}
DIGIT   [0-9]
YEAR    (200[0-9]|20[1-4][0-9]|2050)
MONTH   ([0-9]+)
DAY     ([0-9]+)

%%
{DAY}"/"{MONTH}"/"{YEAR} {
    int day = atoi(yytext + 0);
    int month = atoi(yytext + 3);
    int year = atoi(yytext + 6);

    int days_in_month[] = {0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

    if (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)) {
        days_in_month[2] = 29;  
    }

    if (month >= 1 && month <= 12 && day >= 1 && day <= days_in_month[month]) {
        printf("Valid date: %s\n", yytext);
    } else {
        printf("Invalid date: %s\n", yytext);
    }
}
.|\n        {printf("");}
%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter a Date(DD/MM/YYYY): ");
    yylex();
    return 0;
}
