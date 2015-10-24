%{
    #include "stdio.h"
    #include "stdlib.h"
    #include "string.h"

%}

KEYWORD (?i:strict|graph|digraph|subgraph|node|edge)
ID ([a-zA-Z]|_)([a-zA-Z]|[0-9]|_)*
BLANK \t|\ |\n
DIVIDER ;|,|\{|\}|\[|\]
OTHERS (--)|(->)|(=)
COMMENTS (((\/\/)|#)(.)*(\n))|((\/\*)(.|\n)*(\*\/))

%%

{KEYWORD} {
    printf("keyword %s\n", yytext);
}

{ID} {
    printf("id %s\n", yytext);
}

{BLANK} {
    
}

{DIVIDER} {
    printf("divider %s\n", yytext);
}

{OTHERS} {
    printf("others %s\n", yytext);
}

{COMMENTS} {
    
}

%%