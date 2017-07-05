### Batch convert a bunch of images
```
# Get a bunch of .jpg files and convert them to png
mogrify -format png *.jpg
```

### Strip EXIF information from a photo
```
# All jpg files
exiftool -all= *.jpg
# Single file
exiftool -all= singlefile.jpg
```
