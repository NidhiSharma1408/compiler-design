%{
#include <stdio.h>
%}
/* declare tokens */
%token INT
%token PLUS MINUS TIMES DIV ABS
%token EOL
%%
calclist: /* nothing */ 
 | calclist exp EOL { printf("= %d\n", $1); }
 ;
exp: factor 
 | exp PLUS factor { $$ = $1 + $3; }
 | exp MINUS factor { $$ = $1 - $3; }
 ;
factor: term 
 | factor TIMES term { $$ = $1 * $3; }
 | factor DIV term { $$ = $1 / $3; }
 ;
term: INT 
 | ABS term { $$ = $2 >= 0? $2 : -1* $2; }
;
%%
main(int argc, char **argv)
{
 yyparse();
}
yyerror(char *s)
{
 fprintf(stderr, "error: %s\n", s);
}