# Build my latex already!

The action builds your latex files using the full latex ctan distribution.

## Inputs

### `tex`

**Required** Latex file to build.

### `name`

Output pdf file name.

## Outputs

### `pdf`

Built pdf file.

## Example usage

```actions
name: Build CV
on: 
  push:
    branches:
      master

jobs:
  build_cv:
    name: Build CV
    runs-on: ubuntu-18.04
    steps:
      - name: Checkout repository
        uses: actions/checkout@v1
      - name: Build pdf
        id: build_pdf
        uses: tcibinan/build-latex-already@0.1.7
        with:
          tex: cv.tex
      - name: Retrieve date
        id: resolve_date
        run: echo ::set-output name=date::$(date +'%d.%m.%Y')
      - name: Create or update release
        uses: meeDamian/github-release@v2.0.3
        with:
          token: ${{ secrets.GITHUB_TOKEN }}
          tag: ${{ steps.resolve_date.outputs.date }}
          name: ${{ steps.resolve_date.outputs.date }}
          files: >
            ${{ steps.build_pdf.outputs.pdf }}
          allow_override: true
          gzip: false
```
