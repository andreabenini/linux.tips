# nano editor tips

## Configuration file
Brief config files and tips related to **nano** file editor. **Nano** is still simple and stupid when compared to emacs or vi but sometimes simpler is better

/etc/nanorc
```
## Don't wrap text at all.
set nowrap

## Allow multiple file buffers (inserting a file will put it into a separate buffer).
## You must have configured with --enable-multibuffer for this to work.
##
## Now you can open more than one file and cycle between them with "ALT+," - "ALT+."
set multibuffer

```


## Force syntax
Builtin file support is automatically activated when dealing with files just by checking its extension, 
Syntax definition is used to force coloring with `--syntax` parameter:
```
nano --syntax=python myFileWithoutExtension
```
