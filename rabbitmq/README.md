# Purge / Clear All Queues
```sh
# Get a list of rabbit queues
rabbitmqadmin -f tsv -q list queues name > list.txt
# Iterate and purge that list
for i in `cat list.txt`; do rabbitmqctl purge_queue "$i"; done
```
