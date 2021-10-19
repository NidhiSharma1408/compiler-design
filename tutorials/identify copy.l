%{
    enum yytokentype {
        INT = 258,
        PLUS = 259,
        MINUS = 260,
        MULTIPLY = 261,
        DIVIDE = 262,
        ABS = 263,
        EOL = 264,
       
    };
    int yylval;
%}

%%
"+" { return PLUS; }
"-" { return MINUS;}
"*" { return MULTIPLY; }
"/" { return DIVIDE; }
"|" { return ABS;}
[0-9]+ { yylval = atoi(yytext); return INT;}
\n { return EOL;}
[ \t] {/* ignore this*/}
. {printf("IDK  ");}
%%

main(int argc, char **argv){
    int tok;
    while(tok=yylex()){
        printf("%d", tok);
        if(tok==INT) printf(" = %d\n", yylval);
        else printf("\n");
    }
}