%option noyywrap
%{
    int chars=0, words=0, lines=0;
%}

%%
[a-zA-Z]+ { words++; chars += strlen(yytext); }
\n { lines++; chars++; }
. { chars++; }
%%

int main(int argc, char **argv){
    yylex();
    printf("chars = %d, words = %d, lines = %d", chars, words, lines);
}
