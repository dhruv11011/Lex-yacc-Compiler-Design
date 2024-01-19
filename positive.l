%{
#include<stdio.h>
int Flag = 0;
%}

%%
[-+]?[0-9]+(.[0-9]+)? {
    float CurrentNum = atof(yytext);
    int IntCheck = (int)CurrentNum;

    if(CurrentNum==IntCheck){
        printf("Integer Number\n");
    }
    else{
        printf("Float Number\n");
    }
    if(CurrentNum<0){
        Flag=1;
    }
    if(CurrentNum>=0){
        Flag=0;
    }

    if(Flag==1)
    {
        printf("Negative Number");
    }
    else if(Flag==0)
    {
        printf("Positive Number");
    }
}

.*  {printf("Enter Valid Number");}
%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("Enter The Number : ");
    yylex();
    return 0;
}
