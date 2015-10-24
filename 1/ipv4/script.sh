#!/bin/bash
lex *.lex
gcc lex.yy.c -ll
./a.out < input.txt > output.txt
