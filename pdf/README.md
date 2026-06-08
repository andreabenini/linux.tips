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

### Create one pdf from a bunch of images
ImageMagick+GhostScript to the rescue here, as simple as:
```sh
# Basically concat all images into a single and giant pdf file
img2pdf 1.jpg 2.jpg 3.jpg 4.jpg --rotation=ifvalid -o bigpdffile.pdf

# Shrink, compress, A4-resize. All at once to get a suitably smaller pdf file from it
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sPAPERSIZE=a4 -dPDFFitPage -sOutputFile=output.pdf bigpdffile.pdf
```
