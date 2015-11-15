/* Infix notation calculator. */

%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include "node.h"
    extern int parent_count;
    void yyerror (char const *);
    char temp[100]; 
%}

%union {
  char string[5];
  struct tagNode *node;
}

%token <string> LETTER DOT
%token <string> NGSTAR NGPLUS NGQUEST
%type <node> exp alt concat ngterm term single ignore

%% 
/* Grammar rules and actions follow.  */

input : /* empty */
      | input line
;

line  : '\n'
      | exp '\n'            { printTree($1); printf("\n"); parent_count = 0;}
;

exp   : alt
;

ignore: '(' '?' ':' exp ')' { $$ = $4; }

alt:    concat
      | alt '|' concat  { $$ = make_node("Alt", $1, $3); }
;

concat: ngterm
      | concat ngterm   { $$ = make_node("Cat", $1, $2); }
;

ngterm: term
      | ngterm NGSTAR        { $$ = make_node("NgStar", $1, NULL); }
      | ngterm NGPLUS        { $$ = make_node("NgPlus", $1, NULL); }
      | ngterm NGQUEST        { $$ = make_node("NgQuest", $1, NULL); }
;

term: single
    | term '*'          { $$ = make_node("Star", $1, NULL); }
    | term '+'         { $$ = make_node("Plus", $1, NULL); }
    | term '?'         { $$ = make_node("Quest", $1, NULL); }
;

single: LETTER          { $$ = make_node($1, NULL, NULL); }
      | DOT             { $$ = make_node("Dot", NULL, NULL); }
      | '(' exp ')'    { $$ = make_node("Paren", NULL, $2); }
      | ignore          { $$ = $1; }
;

%%

int main() 
{
    return yyparse();
}

/* Called by yyparse on error.  */
void yyerror (char const *s)
{
    fprintf (stderr, "%s\n", s);
}

