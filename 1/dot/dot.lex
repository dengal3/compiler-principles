%{
    #include "stdio.h"
    #include "stdlib.h"
    #include "string.h"

%}

KEYWORD (?i:strict|graph|digraph|subgraph|node|edge)
ID ([a-zA-Z]|_)([a-zA-Z]|[0-9]|_)*
STRING \"(.|(\/\"))*\"
NUMBER (-)?[0-9]+(\.[0-9]+)?
BLANK \t|\ |\n
DIVIDER ;|,|\{|\}|\[|\]
OTHERS (--)|(->)|(=)
COMMENTS (((\/\/)|#)(.)*(\n))|((\/\*)(.|\n)*(\*\/))
ALL {KEYWORD}|{ID}|{STRING}|{NUMBER}|{BLANK}|{DIVIEDR}|{OTHERS}|{COMMENTS}

%%

{KEYWORD} {
    printf("%s\n", yytext);
}

{ID} {
    printf("%s\n", yytext);
}

{STRING} {
    printf("%s\n", yytext);
}

{NUMBER} {
    printf("%s\n", yytext);
}

{BLANK} {
}

{DIVIDER} {
    printf("%s\n", yytext);
}

{OTHERS} {
    printf("%s\n", yytext);
}

{COMMENTS} {
    
}

%%
