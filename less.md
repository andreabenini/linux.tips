#### Case Insensitive Search
When you're using __less__ (example: command through a pipe with some output coming from it) you can type *"* **-i** *"*
to be able to perform case insensitive searches on that pipe

#### dmesg + less + color
as simple as:
```sh
dmesg --color=always |less -R
```
