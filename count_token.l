%{
#include<stdio.h>
int counter=0;
%}

%%

[ \t\n]  {} /*This is for Ingore WhiteSpaces*/
[0-9]+ {printf("Numbers: %s\n",yytext);counter++;}
[a-zA-Z_][a-zA-Z_]* {printf("Identifier: %s\n",yytext);counter++;}
. {printf("Token: %s\n",yytext);counter++;}
%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter a String: ");
    yylex();
    printf("Total Tokens: %d\n",counter);
    return 0;
}


