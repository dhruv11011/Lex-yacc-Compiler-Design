%{
#include <stdio.h>
%}

%%
int|float|char|double|return|if|else|while { printf("Keyword: %s\n", yytext); }
[0-9]+(\.[0-9]+)? { printf("Number: %s\n", yytext); }
[A-Za-z]+ { printf("Word: %s\n", yytext); }
.|\n ; 

%%

int main()
{
    printf("Enter a statement: ");
    yylex();
    return 0;
}

int yywrap(void)
{
    return 1;
}
