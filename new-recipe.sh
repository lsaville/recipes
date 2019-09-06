#!/usr/bin/env bash

if [ $# -ne 1 ]; then echo "I need a kebob cased recipe title thanks so much"; exit 1; fi

# Donno how to check for kebob case... users fyi you just gotta

#append .md
RECIPE_FILE_NAME="$1.md"

#title case kabob
RECIPE_TITLE=$(echo $1 | gsed -e 's/-/ /g ; s/.*/\L&/ ; s/[a-z]*/\u&/g')

cp recipes/template.md "recipes/$RECIPE_FILE_NAME"

gsed -i "s/# Title/# $RECIPE_TITLE/" "recipes/$RECIPE_FILE_NAME"

echo "* [$RECIPE_TITLE](/recipes/$RECIPE_FILE_NAME)" >> README.md

vim "recipes/$RECIPE_FILE_NAME"
