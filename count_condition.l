%{
    #include<stdio.h>
    int Count=0;
%}

%%
[A-Za-z]+ {
    if(yyleng>4 && yyleng<8){
        Count++;
    }
}
%%

int main()
{
    printf("Enter The Number : ");
    yylex();
    printf("Count = %d",Count);
}

int yywrap()
{
    return 1;
}