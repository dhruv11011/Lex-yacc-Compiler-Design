%{
#include <stdio.h>
#include <string.h>
int count = 0;
%}

%%

"\/\*"[^\n]*"\*\/"               { count++; }
"\/\/"[^\n]*                     { count++; }
.                                {ECHO;}
[a^b]
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

    FILE *file2 = fopen("2.txt", "w");
        yyout = file2;
    printf("File 1 Content Copy Successfully in File 2 without comments.\n");
    yylex();
    fclose(file2);
    fclose(file1);

    printf("Count of comments: %d\n", count);
    return 0;
}
