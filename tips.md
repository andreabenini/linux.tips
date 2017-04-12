
__After sending shutdown command, ssh session doesn't terminate__</br>
Debian does it by default with virtual machines, here's a simple solution
>
> apt-get install libpam-systemd dbus
>
  * Credit: http://unix.stackexchange.com/questions/216950/after-sending-shutdown-command-ssh-session-doesnt-terminate


__Killing remote shell__</br>
To kill a shell just type:
> `<RETURN>~.`


__Changing Window Title__</br>
> `export PROMPT_COMMAND='echo -ne "\033]0;SOME TITLE HERE\007"'`
