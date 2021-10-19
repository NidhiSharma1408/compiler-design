%{
#include<stdio.h>
#include<stdlib.h>
#include "calculator.tab.h"
%}
%option noyywrap

WHITESPACES ([ \t]+)
ICONST ([0-9]+)
FCONST ([0-9]+\.[0-9]+)

%%
{WHITESPACES} { /*DO NOTHING FOR WHITESPACES*/ }
{ICONST} {yylval.integer = atoi(yytext); return INT;}
{FCONST} {yylval.real = (float)atof(yytext); return FLOAT;}

"+" { return (int)'+'; } 
"-" { return (int)'-'; } 
"*" { return (int)'*'; } 
"/" { return (int)'/'; } 
"(" { return (int)'('; } 
")" { return (int)')'; } 
"\n" { return (int)'\n'; }

%%

