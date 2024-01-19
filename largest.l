%{
	#include<stdio.h>
	#include<string.h>
	int largest=0;
	char Max[100]="";
%}

%%
[a-zA-Z]+ {
	if(yyleng > largest){
		largest = yyleng;
		strcpy(Max,yytext);
	}
}
.       
%%
int main(){
	
	printf("Enter the String: ");
    yylex();	
	printf("Largest length: %d\n ",largest);
	printf("Largest word : %s\n ",Max);
}

int yywrap(){
	return 1;
}
