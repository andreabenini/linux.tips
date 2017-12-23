# Command Line Scan
From shell scan an image
```
echo -e "Waiting...\033[1A" && scanimage --format=tiff --progress --resolution=600 --opt_nogamma=yes --opt_realdepth=yes --opt_nowshading=yes --depth 16 > image.tiff
```

Scan an image and add 12% brightness to it
```
echo -e "Please Wait...\033[1A" && scanimage --format=tiff --progress --resolution=600 --opt_nogamma=yes --opt_realdepth=yes --opt_nowshading=yes --depth 16 | convert -brightness-contrast 12 - image.tiff
```
