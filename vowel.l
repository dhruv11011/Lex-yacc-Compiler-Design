%{
#include <stdio.h>
#include <string.h>
int vowelCount = 0;
int consonantCount = 0;
%}

%%
[a-zA-Z]+ {
    if (strchr("aeiouAEIOU", yytext[0])) {
        printf("Word starting with a vowel: %s\n", yytext);
    }
    for(int i = 0;i<yyleng;i++)
    {
        if(strchr("aeiouAEIOU",yytext[i]))
        vowelCount++;
        else
        consonantCount++;
    }
}
. ;

%%
int yywrap()
{
	return 1;
}

int main() 
{
    printf("Enter a String: ");
    yylex();
    printf("Count of Vowel: %d\n", vowelCount);
    printf("Count of Consonant: %d\n", consonantCount);
    return 0;
}
