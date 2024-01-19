%{
#include<stdio.h>
#include<string.h>
int wc=0;
int lc=0;
int cc=0;
%}

%%
[a-zA-Z_]+ {wc++;cc+=strlen(yytext);}
\n         {lc++;cc++;}
.          {cc++;}
%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter a String: ");
    yylex();
    printf("\nNumber of Words = %d\n",wc);
    printf("\nNumber of Lines = %d\n",lc);
    printf("\nNumber of Characters = %d\n",cc);
    return 0;
}