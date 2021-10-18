%option noyywrap
%{
# include "calc.tab.h"
int yyvalue;
%}

%%
"+" {  return PLUS; }
"-" {  return MINUS; }
"*" {  return TIMES; }
"/" {  return DIV; }
"|" {  return ABS; }
"-"?[0-9]+ {  yyvalue = atoi(yytext); return INT; }
\n {  return EOL; }
. { /*ignore*/ }
