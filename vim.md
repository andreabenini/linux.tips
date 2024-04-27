# Disable mouse toggle to visual mode
If you're using `vim` from X11 environment you probably want to use your mouse with WindowManager features and avoid _vi_ direct control or editor toggle to
visual mode. This is already its default behavior but not correctly loaded if a user default `.vimrc` file is **not** found.  
To keep this default behavior just create an empy _.vimrc_ file as suggested here:
```sh
mkdir ~/.vim/; [[ -s ~/.vim/vimrc ]] && echo "aborted, file exists" || :> ~/.vim/vimrc
```

# Useful commands
### Tabstops and spaces
set tabstops every 4 spaces and set the shiftwidth that amount you indent as 4 spaces also to match your tabstops
```
set ts=4 sw=4
```
