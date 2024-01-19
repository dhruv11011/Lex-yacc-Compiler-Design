%{
#include <stdio.h>
#include<string.h>
int wordCount = 0;
%}

%%
[a-zA-Z@!#$%?*&^]+ {
    int i = 0;
    int count = 0;
    for(i = 0;i<yyleng;i++)
    {
        if(!(strchr("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",yytext[i])))
        count++;
    }
    if(count!=0)
    wordCount++;

    if(count>2)
    printf("ThS Word have more than two characters other than alphabets: %s",yytext);
}
%%

int yywrap()
{
	return 1;
}

int main() {
    printf("Enter a Sentence: ");
    yylex();
    printf("Words that have a special character: %d",wordCount);
    return 0;
}
