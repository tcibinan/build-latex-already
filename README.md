# Build my latex already!

The action builds your latex files using the full latex ctan distribution.

## Inputs

### `tex`

**Required** Latex file to build.

## Outputs

### `pdf`

Built latex file in pdf format.

## Example usage

```actions
uses: tcibinan/build-latex-already@v0.1
with:
  tex: 'cv.tex'
```
