extern int yylineno; //from lexer
void yyerror(chat *s); 

//node of ast
struct ast{
    int nodetype;
    struct ast *l;
    struct ast *r;
}

struct numvalue
{
    int nodetype;
    double number;
};

//functions to build ast
struct ast *newast(int nodetype, struct ast *l, struct ast *r);
struct ast *newnum(double d);

//evaluate the ast
double eval(struct ast*);

//delete and free ast
void treefree(struct  ast *);