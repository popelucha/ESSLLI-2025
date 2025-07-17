#!/usr/bin/sh

SOURCE_FORMAT="markdown_strict\
+pipe_tables\
+backtick_code_blocks\
+auto_identifiers\
+strikeout\
+yaml_metadata_block\
+implicit_figures\
+all_symbols_escapable\
+link_attributes\
+smart\
+fenced_divs"

INPUT=$1
DIR="$(dirname "${INPUT}")"
OUTPUT=${DIR}.tex

echo "Writing $INPUT to $OUTPUT"

pandoc -f "$SOURCE_FORMAT"  -t beamer $INPUT -o $OUTPUT
