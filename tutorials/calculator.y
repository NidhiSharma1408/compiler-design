%{
#include<stdio.h>
int yylex(void);
void yyerror(char const *s);
#define YYDEBUG 1
%}

%union {
    int integer;
    float real;
}
%token <integer> INT 
%token <real> FLOAT
%type <real> exp 
%left '-' '+'
%left '*' '/'
%left UNEG UPOS

%start s //start symbol
%%

s: s line
    |  /*empty line*/
;
line: '\n'
    | exp '\n' { printf("%f\n", $1); }
    | error '\n' { yyerrok; /*error is a reserved word and yyerrok() is a macro defined by bison*/}
;
exp: INT { $$ = (float) $1;}
    | FLOAT
    | exp '+' exp { $$ = $1+$3 ; }
    | exp '-' exp { $$ = $1-$3 ; }
    | exp '*' exp { $$ = $1*$3 ; }
    | exp '/' exp { if($3==0) yyerror("DIVIDE BY ZERO"); else $$ = $1/$3 ; }
    | '-' exp %prec UNEG { $$ = -$2; }
    | '+' exp %prec UPOS { $$ = $2; }
    | '(' exp ')' { $$ = $2; }
;

%%
int main(){
    return yyparse();
}

void yyerror(char const *s){
    fprintf(stderr, "error: %s\n", s);
}