# tmux tips

Create a new session

    tmux new-session -n WindowTitle -s SessionName
    # the one below is suitable for iTerm2 client with its native tmux integration
    tmux -CC new-session -n WindowTitle -s SessionName

Attach to an existing session

    tmux attach -t SessionName

List available sessions

    tmux list-sessions
    tmux ls

Kill session:

    tmux kill-session -t myname


## Sessions

    :new<CR>  new session
    s  list sessions
    $  name session

## Windows (tabs)

    c           new window
    ,           name window
    w           list windows
    f           find window
    &           kill window
    .           move window - prompted for a new number
    :movew<CR>  move window to the next unused number

## Panes (splits)

    %  horizontal split
    "  vertical split
    
    o  swap panes
    q  show pane numbers
    x  kill pane
    ⍽  space - toggle between layouts

## Window/pane surgery

    :joinp -s :2<CR>  move window 2 into a new pane in the current window
    :joinp -t :1<CR>  move the current pane into a new pane in window 1


## Misc

    d  detach
    t  big clock
    ?  list shortcuts
    :  prompt
