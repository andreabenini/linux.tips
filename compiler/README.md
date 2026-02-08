# Tricks and useful features on Makefile and compilers
If you're compiling in your makefile and you have pipes for refining output it might be a mess if you also need to catch compilation errors. If you have something like:
```make
  @# it can be ninja, gcc, cc or whatsoever...
  @ninja -C $(BUILD_DIR) dis | sed -u 's|Compiling C object .*/src_\(.*\)\.c\.o|Compiling src/\1.c|;s|Compiling C object .*/\(.*\)\.c\.o|Compiling \1.c|'
```
It usually goes straight and when you use: **`make all run`**, the `run` part will be executed even if `make all` contains errors. Errors (from ninja this time) won't be
catched because of pipes there used to refine and prettify output.  
This can be solved just by adding `set -o pipefail` and using bash for it. This breaks pipes when errors were reported earlier. All you have to do is:
```Makefile
# Force the use of bash for pipefail
SHELL := /bin/bash

# Wherever you have your compile function or instruction just add the "@set -o pipefail;" part, for example:
@set -o pipefail; ninja -C $(BUILD_DIR) dis | sed -u 's|Compiling C object .*/src_\(.*\)\.c\.o|Compiling src/\1.c|;s|Compiling C object .*/\(.*\)\.c\.o|Compiling \1.c|'
```
