%{
#include<stdio.h>
int i, j, flag;
%}

%%

[a-zA-Z0-9]+ {
    for (i = 0, j = yyleng - 1; i < j; i++, j--) {
        if (yytext[i] == yytext[j]) {
            flag = 1;
        } else {
            flag = 0;
            break;
        }
    }
    if (flag == 1)
        printf("Given string is Palindrome\n");
    else
        printf("Given string is not a Palindrome\n");
}

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter Your String: ");
    yylex();
    return 0;
}
