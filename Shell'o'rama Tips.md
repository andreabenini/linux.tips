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


## Shell fork bomb
```
:(){ :|:& };:
```
