%{
    #include <stdio.h>
    #include <string.h>
    #include "regex.tab.h"
%}

%x ignore_capture

%%

[^.()*+?:|\n]        { char temp[100] = "Lit("; strcat(temp, yytext); strcat(temp, ")"); strcpy(yylval.string, temp); return LETTER;}
"."             { strcpy(yylval.string, yytext); return DOT; }
":"              { return ':'; }
"("              { return '('; }
")"              { return ')'; }
"*"              { return '*'; }
"+"              { return '+'; }
"?"              { return '?'; }
"|"              { return '|'; }
"*?"              { strcpy(yylval.string, yytext); return NGSTAR; }
"+?"              { strcpy(yylval.string, yytext); return NGPLUS; }
"??"              { strcpy(yylval.string, yytext); return NGQUEST; }
"\n"              { return '\n'; }

%%

int yywrap(void) {
    return 1;
}