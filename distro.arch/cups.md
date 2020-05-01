# Restart cups
```
systemctl restart org.cups.cupsd
```

## Few tips
Brother printers, among others, still requires lib32 deps because their drivers really sucks.
Sometimes you're forced to install `lib32-glibc` even if you're running an AMD64 platform so you're warned.
Double check it with your driver manufacturer and try to understand if this is your case.  

## `page not found` error
It happened to me just once but after a successful printer driver installation I was able to print something from driver
without physically seeng something on paper. CUPS sent the job to the printer without errors but I didn't get my print job
done.  
If you take a look at the `/var/log/cups` directory you'll probably see some errors in the `error_log` file.
If there're some messages containing `"No pages found"` in your log file, there might be troubles with your postscript libs
or you probably don't have them installed.  
After struggling for a while I ended up (and solved the problem) with few minor packages installations. Just install:  
- `a2ps`
- `psutils`

and you'll be fine. Those twos will install `ghostscript` and various libs as dependencies and after that you'll solve
the problem.
