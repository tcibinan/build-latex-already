#!/bin/bash

set -eo pipefail

ROOT_FILE="$1"

GITHUB_WORKSPACE="${GITHUB_WORKSPACE:-/github/workspace}"

OUTPUT_DIR="outputs"
OUTPUT_PDF=$(basename "$ROOT_FILE")
OUTPUT_PDF="${OUTPUT_PDF%.*}"

cd "$GITHUB_WORKSPACE"
mkdir "$OUTPUT_DIR"

pdflatex -output-directory="$OUTPUT_DIR" \
         "$ROOT_FILE"

echo "::set-output name=pdf::$OUTPUT_PDF"
