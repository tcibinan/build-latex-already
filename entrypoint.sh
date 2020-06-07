#!/bin/bash

set -eo pipefail

GITHUB_WORKSPACE="/github/workspace"

INPUT_TEX="$INPUT_TEX"
OUTPUT_DIR="outputs"
OUTPUT_PDF=$(basename "$INPUT_TEX")
OUTPUT_PDF="${OUTPUT_PDF%.*}.pdf"

cd "$GITHUB_WORKSPACE"
mkdir "$OUTPUT_DIR"

pdflatex -output-directory="$OUTPUT_DIR" \
         "$INPUT_TEX"

echo "::set-output name=pdf::$OUTPUT_PDF"
