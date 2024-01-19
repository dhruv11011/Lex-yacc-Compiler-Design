%{
#include <stdio.h>
#include <stdlib.h>
int flag = 0, j, c;
%}

%%

[0-9]+ {
    c = atoi(yytext);
    flag = 0;

    if (c == 2) {
        printf("This is a Prime Number.\n");
    } else if (c == 0 || c == 1) {
        printf("This is Not a Prime Number.\n");
    } else {
        for (j = 2; j < c; j++) {
            if (c % j == 0) {
                flag = 1;
                break;
            }
        }
    }

    if (flag == 1) {
        printf("This is Not a Prime Number.\n");
    } else {
        printf("This is a Prime Number.\n");
    }
}

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter The Number: ");
    yylex();
    return 0;
}
