%{
#include<stdio.h>
%}

%%

[6789][0-9]{9} {printf("Given Mobile Number is Valid.");}
.*              {printf("Given Mobile Number is Not Valid.");}

%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("\nEnter the mobile number:");
    yylex();
    return 0;
}