## Parsing input parameters with bash script
I still prefer python btw but this is a nice idea to parse input parameters
with few lines of bash scripting
```sh
help_usage() {
    echo -e "\nSome kind of help for my script (--param1 <p1>, --filename <file>)\n"
    exit 1
}
## Parsing input params
if [[ $# -eq 0 ]]; then
    help_usage
fi
PARAM1="defaultvalue"
FILE="defaultfilename"
while [[ $# -gt 0 ]]; do
    case "$1" in
        -p|--param1)
            PARAM1="$2"
            shift        # Argument
            shift        # Value
            ;;
        -f|--filename)
            FILE="$2"
            shift        # Argument
            shift        # Value
            ;;
        *)
            help_usage
            ;;
    esac
done
# ... and there you have it ...
```

## while not EOF do
Simple file loop without **read** statements so I can use them elsewhere
```sh
for line in $(cat ~/ben/filename); do echo "-->$line<-- (hit enter)"; read junk; done
```
Same as above but it gets an entire line at a time from a file
```sh
while IFS="" read -r LINE || [ -n "$LINE" ]; do
    echo ">>$LINE<<"
done <<< $(cat ~/ben/filename)
```


## ls, list and count them
`ls` files in a dir and count them, quite useful when dealing with huge number of them
```sh
MYDIR=/home/ben
ls -la $MYDIR/ ; echo $((`ls -la /$MYDIR/|wc -l` -3 ))

# Or oneshot with an alias...
```

## ls full path
`ls` to list files, `awk` to transform into fullpath filenames, `grep` to gather data from it.  
Useful inside a container or when you don't have `find` with you
```sh
ls -R / 2>/dev/null | awk '
/:$/&&f{s=$0;f=0}
/:$/&&!f{sub(/:$/,"");s=$0;f=1;next}
NF&&f{ print s"/"$0 }' |grep WhatEverFileName
```

## Shell colors
My favorite shell colors (gentoo rocks) on /etc/bash/bashrc, /etc/bash.bashrc or whatever your favorite Linux OS calls it
```sh
    # Shell prompt
    if [[ ${EUID} == 0 ]] ; then
        PS1='\[\033[01;31m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
    else
        PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
    fi
    # ls colors
    alias ls='ls --color=auto'
```


## Shell separator-\<hr> like command
```
# Print a separator until last column
printf '━%.0s' $(seq $COLUMNS)

# Same as above but preferred if seq is not fully supported
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
```

## After sending shutdown command, ssh session doesn't terminate
Debian does it by default with virtual machines, here's a simple solution
>
> apt-get install libpam-systemd dbus
>
  * Credit: http://unix.stackexchange.com/questions/216950/after-sending-shutdown-command-ssh-session-doesnt-terminate

---

## Killing remote shell
To kill a shell just type:
> `<RETURN>~.`

---

## Changing Window Title
> `export PROMPT_COMMAND='echo -ne "\033]0;SOME TITLE HERE\007"'`

---

## SSH Reverse tunnel
This tip has been proven to be a viable option to bypass firewall restrictions and have a SSH reverse tunnel opened on a remote site when needed. You just need to open a SSH tunnel FROM remote server TO your machine, later on you may safely connect to your own machine (localhost) and use that reverse tunnel. Just pick these two things:
##### SERVER SIDE
> ssh -R 9999:localhost:22 sourceuser@[your.own.IP.public.address]
>
##### CLIENT SIDE
On your side (client) you may safely open a shell to yourself
> ssh localhost -p 9999
>
and here it goes the reverse tunnel

---

## 'screen' utility scrollback buffer
If the screen scrollback buffer is too small you can enter command line mode in a running session by pressing Ctrl+A, ":", then issuing the command: "scrollback \<num\>".</br>
Example: "scrollback 10000" to get a 10000 line buffer.</br>
You can also set the default number of scrollback lines by adding:
> defscrollback 10000

to your ~/.screenrc file.


## Internet Check
Somewhat nice and eye catching when you've a 10000 lines terminal full of ping output
```sh
# Using Google but whatever other classic ip is fine too
ping 8.8.8.8 | sed -e 's/Unreachable/Unreachable\r ❌ /' -e 's/ ms/ ms\r✅/'
```


## Shell fork bomb
A classic to use where ulimit is not set :)
```
:(){ :|:& };:
```
