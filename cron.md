# /etc/crontab
Crontab examples on system wide file /etc/crontab
```conf
# /etc/crontab: system-wide crontab
#

#
# Cron Syntax
#
#  .---------------------------- Minute
#  |    .----------------------- Hour
#  |    |    .------------------ Day of month
#  |    |    |  .--------------- Month
#  |    |    |  |  .------------ Day of week
#  |    |    |  |  |   .-------- User
#  |    |    |  |  |   |     .-- Command 
#  |    |    |  |  |   |     |
#  *    *    *  *  *   *     *

# do it once at startup, after 120s
@reboot   root  sleep 120 && myFullPathCommand

# Every 4h, start program
0  */4    *  *  *   root  myFullPathCommand
```
