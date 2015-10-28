#!/bin/bash
option="$1"


if [ "${option}" = clean ];
    then
    find ./ -not -name "*.flex" -not -name "*input*" -not -name "*.sh" -type f -print0 | xargs -0 rm
else
    lex *.flex
    gcc lex.yy.c -ll
    ./a.out < input.txt > output.txt
fi
