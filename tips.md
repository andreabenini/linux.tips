
__After sending shutdown command, ssh session doesn't terminate__</br>
Debian does it by default with virtual machines, here's a simple solution
>
> apt-get install libpam-systemd dbus
>
  * Credit: http://unix.stackexchange.com/questions/216950/after-sending-shutdown-command-ssh-session-doesnt-terminate

---

__Killing remote shell__</br>
To kill a shell just type:
> `<RETURN>~.`

---

__Changing Window Title__</br>
> `export PROMPT_COMMAND='echo -ne "\033]0;SOME TITLE HERE\007"'`

---

__SSH Reverse tunnel__</br>
This tip has been proven to be a viable option to bypass firewall restrictions and have a SSH reverse tunnel opened on a remote site when needed. You just need to open a SSH tunnel FROM remote server TO your machine, later on you may safely connect to your own machine (localhost) and use that reverse tunnel. Just pick these two things:
##### SERVER SIDE
> ssh -R 9999:localhost:22 sourceuser@[your.own.IP.public.address]
>
##### CLIENT SIDE
On your side (client) you may safely open a shell to yourself
> ssh localhost -p 9999
>
and here it goes the reverse tunnel
