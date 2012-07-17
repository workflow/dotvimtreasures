#!/bin/sh

echo -n "\n\033[31m"
sed -n "/ $1(/, /\*/ p" ~/.vim/php/php_manual.txt | grep -v '*' 
echo -n "\033[0m"
