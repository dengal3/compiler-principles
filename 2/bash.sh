#!/bin/bash
option="$1"


if [ "${option}" = clean ];
    then
    find ./ -not -name "*.y" -not -name "*.flex" -not -name "*.h" -not -name "*input*" -not -name "*output*" -not -name "*.sh" -type f -print0 | xargs -0 rm
else
    bison -d *.y
    lex *.flex
    gcc lex.yy.c *.tab.c -ly -ll -o regex
    ./regex < "regex.input" > "myRegex.output"
    echo "diff regex.output and myRegex.output: "
    diff regex.output myRegex.output
    if [ $? == 0 ]; then
       echo "Success!"
    fi
fi