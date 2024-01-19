%{
#include <stdio.h>
#include <string.h>
int count = 0;
%}

%%

if|else|while|for|return|printf|scanf|int|void {count++;}

%%

int yywrap()
{
    return 1;
}

int main()
{
    FILE *file1 = fopen("1.txt", "r");
    if (!file1)
    {
        printf("Failed to open the file.\n");
        return 1;
    }
    else
    {
        yyin = file1;
    }
    yylex();
    fclose(file1);

    printf("Count of keywords: %d\n", count);
    return 0;
}
