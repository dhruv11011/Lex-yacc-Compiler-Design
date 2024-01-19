%{ 
#include<stdio.h>
int x;
%}

%%

[0-9]+ {x=atoi(yytext);
        if(x%2==0)
        {
            printf("Given Number is Even.\n");
        }
        else
        {
            printf("Given Number is Odd.\n");
        }
        }
.* {printf("This is Not Valid Input...\n");}
%%
int yywrap(){}
int main()
{
    printf("Enter a Number: ");
    yylex();
    return 0;
}