# To copy-paste with your mouse you need to:
temporarly disable mouse functions with:
```
PREFIX : set -g mode-mouse off              # Disable mouse functions
PREFIX z                                    # Maximize current window
```
Now you can do what you want on terminal with your mouse in a full sized window, when you're done you can go back to previous
state with
```
PREFIX z                                    # UnMaximize current window
PREFIX : set -g mode-mouse on               # ReEnable mouse functions
```
