%{
    #include <stdio.h>
%}

%token NAME NUMBER

%%
statement : NAME '=' expression
          | expression { printf("= %d\n", $1); }
          ;

expression : expression '+' expression { $$ = $1 + $3; }
           | expression '-' expression { $$ = $1 - $3; }
           | expression '*' expression { $$ = $1 * $3; }
           | expression '/' expression
           {
            if($3 == 0)
                yyerror("Divide By Zero");
            else
                $$ = $1 / $3;
           }
           | '-' expression  { $$ = -$2; }
           | '(' expression ')' { $$ = $2; }
           | NUMBER { $$ = $1; }
           ;
%%

void main()
{
    printf("Enter an arithmetic expression: ");
    yyparse();
}

void yyerror(const char* s)
{
    printf("Invalid arithmetic expression: %s\n", s);
}