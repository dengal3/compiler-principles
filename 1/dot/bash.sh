#!/bin/bash
option="$1"


if [ "${option}" = clean ];
    then
    find ./ -not -name "*.flex" -not -name "*input*" -not -name "*output*" -not -name "*.sh" -type f -print0 | xargs -0 rm
else
    lex *.flex
    gcc lex.yy.c -ll
    ./a.out < input.dot > output.txt
    echo "diff output.good and output.txt: "
    diff output.good output.txt
fi
