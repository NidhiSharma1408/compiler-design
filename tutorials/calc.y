%{
#include<math.h>
#include<stdio.h>
%}

%token INT
%token PLUS MINUS MULTIPLY DIVIDE ABS
%token EOL
%token OP CP
%token AND OR EXP XOR

%%
prog: | prog exp EOL {printf(" = %d \n", $2);};


exp: factor
    | exp PLUS exp {$$ = $1 + $3;}
    | exp MINUS exp {$$ = $1 - $3;}
    | exp AND exp {$$ = $1 & $3;}
    | exp OR exp {$$ = $1 | $3;}
    | exp XOR exp {$$ = $1 ^ $3;}
;

factor: term
    | term MULTIPLY term {$$ = $1 * $3;}
    | term DIVIDE term {$$ = $1 / $3;}
    | factor MULTIPLY factor {$$ = $1 * $3;}
    | factor DIVIDE factor {$$ = $1 / $3;}
    | factor EXP factor { $$ = (int)(pow($1,$3)+0.5); }
;

term: INT
    | ABS INT {$$ = ($2>=0)? $2 : -$2;}
    | OP exp CP { $$=$2; }
;

%%
main(int argc, char **argv){
    yyparse();
}

yyerror(char *s){
    fprintf(stderr, "error: %s\n", s);
}