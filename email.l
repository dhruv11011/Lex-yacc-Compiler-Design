%{
#include<stdio.h>
%}

DIGIT       [0-9]
LETTER      [a-zA-Z]
ALPHANUM    ({LETTER}|{DIGIT})
USERNAME    ([a-zA-Z][a-zA-Z0-9_.-]*)
COM_DOMAIN  com
PDPU_DOMAIN pdpu.ac.in
DOMAIN      ({ALPHANUM}+\.)*({COM_DOMAIN}|{PDPU_DOMAIN})
EMAIL       {USERNAME}@{DOMAIN}

%%
{EMAIL}     printf("Valid email: %s\n", yytext);
.*          printf("Invalid email: %s\n", yytext);
%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter Your Email Address: ");
    yylex();
    return 0;
}

