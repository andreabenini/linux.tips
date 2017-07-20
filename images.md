### Batch convert a bunch of images
```
# Get a bunch of .jpg files and convert them to png
mogrify -format png *.jpg
```

### Convert a PDF to a JPG
```
# gs (GhostScript) and gm (GraphicsMagick) are required in order to make it work
# Take the first page and make a thumbnail out of it
gm convert -size 128x128 '/path/to/document.pdf[0]' -resize 128x128 +profile "*" '/path/to/PREVIEW.jpg
```

### Convert a HTML to a JPG
```
# html2ps (html2ps), gs (GhostScript) and gm (GraphicsMagick) are required in order to make it work
# Take the first page and make a thumbnail out of it
gm convert -size 128x128 '/path/to/document.pdf[0]' -resize 128x128 +profile "*" '/path/to/PREVIEW.jpg 2>/dev/null
## 2>/dev/null to avoid '*** Error opening thumb*' error lines [CentOS 6.8 did it]
```

### Strip EXIF information from a photo
```
# All jpg files
exiftool -all= *.jpg
# Single file
exiftool -all= singlefile.jpg
```
