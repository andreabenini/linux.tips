# tmux tips

Create a new session
```
tmux new-session -n WindowTitle -s SessionName
# the one below is suitable for iTerm2 client with its native tmux integration
tmux -CC new-session -n WindowTitle -s SessionName
```
Attach to an existing session
```
tmux attach -t SessionName
```
List available sessions
```
tmux list-sessions
```
