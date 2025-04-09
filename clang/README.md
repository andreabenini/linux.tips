# clang tips and tricks

### clangd file configuration
This is a yaml file, apply proper formattings accordingly
-  based on a single project (file `.clangd` in the source tree)
-  user based configuration. This expands to each single project the user manages in the host, tipically:
   * `~/.config/clangd/config.yaml` (linux)
   * `~/Library/Preferences/clangd/config.yaml` (macOS)
   * `%LocalAppData%\clangd\config.yaml` (win)


### Examples:
- Hide inlay hints: variable names in a function call (`.config/clangd/config.yaml`)  
  https://clangd.llvm.org/extensions#inlay-hints
  ```yaml
  InlayHints:
    Enabled: No
  ```

### Links and extended documentation
- https://clangd.llvm.org/config
