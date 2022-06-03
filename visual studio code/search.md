# Multiline search
Multiline, starting with "\[WARNING" and ending after multiple line with "line 11)" (ansible verbose weirdos)

```txt
\[WARNING(.*\n)*?.*line 11\)$
```
