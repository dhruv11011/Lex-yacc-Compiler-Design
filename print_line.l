%{
#include <stdio.h>
int line_number = 1;
%}

%%
.+\n {
    printf("%3d: %s", line_number++, yytext);
}

%%

int yywrap()
{
    return 1;
}

int main() {
    FILE *file = fopen("2.txt", "r");
    if (!file) {
        printf("Failed to open the file.\n");
        return 1;
    }
    else
    {
        yyin=file;
    }
    yylex();
    fclose(file);
    return 0;
}
