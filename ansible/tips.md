# ansible --list-hosts
Nicely format `--list-hosts`, one line per host
```sh
#  Line 7 "should be line with 'hosts (xxx):', cutting first 7 lines from stream and producing a bare list
ansible-playbook --verbose playbooks/myplaybook.yaml --list-hosts 2>/dev/null |awk 'NR > 7 { print $1 }'
```
