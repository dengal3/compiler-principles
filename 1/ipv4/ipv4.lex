%{
    #include "stdio.h"
    #include "stdlib.h"
    #include "string.h"

%}

ENTER \n
UNIT ([0-9])|([1-9][0-9])|(1([0-9]){2})|(2[0-4][0-9])|(25[0-5])
VALID ^(({UNIT}\.){3})({UNIT})$
INVALID ^(.)*

%%
{VALID} {
    char* part;
    part = strtok(yytext, ".");
    if (part != NULL) {
        int num = atoi(part);
        if (num < 128) {
            printf("A");
        } else if (num < 192) {
            printf("B");
        } else if (num < 224) {
            printf("C");
        } else if (num < 240) {
            printf("D");
        } else {
            printf("E");
        }
    }
}

{INVALID} {
    printf("INVALID");
}



%%