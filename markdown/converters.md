# Markdown converters

## Simple script
`pandoc` or `python grip` are preferred ways to convert markdown to PDF files, 
but if you're not satisfied by them because:
- pandoc is **huge**, it installe the whole TeX environment and **haskell language** but 
you still prefer to keep a lightweight machine
- **grip** is fine but you still need to do some manual processing (visiting localhost:5000)
and use Chromium to save your page as PDF

You can try this script which consists of the combination of `md2html` and `wkhtmltopdf`.
Those two utils are really lightweight and are as simple as:
```sh
md2html README.md --full-html --github --output=readme.html     # MD   -> HTML
wkhtmltopdf --page-size A4 readme.html  readme.pdf              # HTML -> PDF
rm readme.html
```
or automate it with this simple script
```sh
#!/usr/bin/env bash
#
# MD to PDF converter
# Change formatting options at will
#
FILENAME=$1
if [ "$1" == "" ]; then
    echo "Usage: $0 <filename.md>"
    exit 1
fi
if [ ! -f "$FILENAME" ]; then
    echo "File: '$FILENAME' does not exists"
    exit 1
fi
md2html $FILENAME --full-html --github --output="$FILENAME.html"   
wkhtmltopdf --page-size A4 "$FILENAME.html" "${FILENAME%.*}.pdf"
rm -f "$FILENAME.html"
```


## Markdown to PDF
Some alternatives are listed here:
### pandoc
- Requires texlive/latex deps
- Might be on external repo (_RHEL based_: **epel**)
- Lots of options, possible customizations
### python: grip
- python based
- python utility: **grip**
- installable with `pip`
- easy to use
### python: Markdown2PDF
- python based
- python utility: **md2pdf**
- installable with `pip`
- easy to use
### javascript: markdown-pdf
- javascript based
- utility: **markdown-pdf**
- `npm install markdown-pdf`
- easy to use

# HTML converters
## HTML to PDF
**wkhtmltopdf** (or _wkhtml2pdf_)
```sh
# Margins: -B 0mm -L 0mm -R 0mm -T 0mm
# Local file access: --enable-local-file-access
# Enable internal links: --enable-internal-links
wkhtmltopdf -B 0mm -L 0mm -R 0mm -T 0mm  --enable-local-file-access --enable-internal-links source.html dest.pdf
```
