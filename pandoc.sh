#!/usr/bin/bash

SOURCE_FORMAT="markdown_strict\
+pipe_tables\
+multiline_tables\
+backtick_code_blocks\
+auto_identifiers\
+strikeout\
+yaml_metadata_block\
+implicit_figures\
+all_symbols_escapable\
+link_attributes\
+smart\
+tex_math_dollars\
+fenced_divs"

INPUT=$1
DIR="$(dirname "${INPUT}")"
OUTPUT=${DIR}.tex

echo "Writing $INPUT to $OUTPUT"

pandoc --columns 70 -f "$SOURCE_FORMAT"  -t beamer --filter ./pandoc_minted.py  $INPUT -o $OUTPUT
