#!/bin/bash

set -eo pipefail

GITHUB_WORKSPACE="/github/workspace"

INPUT_TEX="$INPUT_TEX"
INPUT_NAME="$INPUT_NAME"

OUTPUT_DIR="outputs"
if [[ "$INPUT_NAME" ]]
then
  OUTPUT_NAME="$INPUT_NAME"
else
  OUTPUT_NAME=$(basename "$INPUT_TEX")
fi
OUTPUT_PDF="$OUTPUT_DIR/${OUTPUT_NAME%.*}.pdf"

cd "$GITHUB_WORKSPACE"
mkdir -p "$OUTPUT_DIR"

pdflatex -output-directory="$OUTPUT_DIR" \
         -jobname="$OUTPUT_NAME" \
         "$INPUT_TEX"

echo "::set-output name=pdf::$OUTPUT_PDF"
