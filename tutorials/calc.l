%{
#include "calc.tab.h"
%}

%%
"+" { return PLUS; }
"-" { return MINUS;}
"*" { return MULTIPLY; }
"/" { return DIVIDE; }
"|" { return ABS;}
"(" { return OP;}
")" { return CP;}
"|" { return OR;}
"&" { return AND;}
"^" { return XOR; }
"**" { return EXP;}
-?[0-9]+ { yylval = atoi(yytext); return INT;}
"/*"([^*]|\*+[^*/])*\*+"/" { /*ignore this as it is multiline comment*/ }
\n { return EOL;}
[ \t] {/* ignore this*/}
"//".*\n {/*ignore this too*/}
. { printf("IDK  ");}
%%

