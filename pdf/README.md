# PDF Tips & Tricks

### Concatenate multiple PDF files into one
**pdfunite** comes handy in these cases and you should probably already have it installed
```sh
# [src] [src] [src] [output.pdf]
pdfunite in-1.pdf in-2.pdf in-n.pdf out.pdf
```

### Shrink an insanely huge pdf to a smaller one
**ghostscript** to the rescue, as usual
```sh
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=output.small.pdf your.huge.file.pdf
```
