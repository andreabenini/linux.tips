# Troubleshooting
## Empty page once opened
If you see an empty page once opened it might be a compatibility issue related to: your video card,
flaky GPU acceleration, weird Electron caching mechanism. It happened to me with: SUSE Tumbleweed, 
AMD Radeon Graphic Card, Gnome+XWindow. This is what I did to solve the problem:
- try to manually restart vscode without the GPU acceleration, you can do it explicitly with this
  command: `code --disable-gpu`. If you can now see a normal behavior from VisualStudioCode it might
  be this case
- Close Visual Studio Code (no matter if you opened it with GPU flag disabled)
- Clear local cache  
    ```sh
    cd ~/.config/Slack
    rm -rf GPUCache Cache Code\ Cache
    ```
- Normally restart Visual Studio Code, if you don't see any issues that problem was related to the
    cache and GPU acceleration
