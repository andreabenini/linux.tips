# Markdown converters
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
