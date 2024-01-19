%{
#include<stdio.h>
int y;
%}

%%

[0-9]{4}    {y=atoi(yytext);
            if(y%400==0)
                printf("This is a Leap Year.",yytext);
            else if(y%100==0)
                printf("This is Not a Leap Year.",yytext);
            else if(y%4==0)
                printf("This is a Leap Year.",yytext);
            else
                printf("This is Not a Leap Year.");                  
            }
.*           {printf("Not a Valid Input.\n",yytext);}

%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter a Year: ");
    yylex();
    return 0;
}