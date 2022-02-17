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

    :new<CR>                new session
    s                       list sessions
    $                       name session

## Scrolling features

    <Ctrl>+b+[              Command mode, scroll mode
        <arrows keys>       Move with arrows keys around
        <page keys>         Scroll backwards and forwards one screen at a time
    <Ctrl>+c                When done with the scroll

## Windows (tabs)

    c                       new window
    ,                       name window
    w                       list windows
    f                       find window
    &                       kill window
    .                       move window - prompted for a new number
    :movew<CR>              move window to the next unused number
    n                       next window
    p                       previous window
    0...9                   select window by number

## Panes (splits)

    %                       horizontal split
    "                       vertical split
    
    o                       swap panes
    q                       show pane numbers
    x                       kill pane
    ⍽  space                toggle between layouts
    resize-pane -Z          toggle a pane between normal and zoomed mode
    resize-pand -D 5        Resize down a pane by adding 5 rows to it
    resize-pand -U 5        Resize up a pane by adding 5 rows to it

## Window/pane surgery

    :joinp -s :2<CR>        Move window 2 into a new pane in the current window
    :joinp -t :1<CR>        Move the current pane into a new pane in window 1


## Misc

    d                       Detach
    t                       Big clock
    ?                       List shortcuts
    :                       Prompt
