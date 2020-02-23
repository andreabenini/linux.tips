
Sample taken from internal lab
```
http {
    upstream upstreamGroup {
        # Default: round_robin
        # Least connected server
        # least_conn;
        # Session persistence (sticky sessions)
        # ip_hash
        
        server server1.example.com;
        # server server1.example.com weight=3 max_fails=3;
        server server2.example.com;
        server server3.example.com;
    }

    server {
        listen 80;

        location / {
            proxy_pass http://upstreamGroup;
        }
    }
}
```
`fastcgi_pass`, `uwsgi_pass`, `scgi_pass`, `memcached_pass`, `grpc_pass` directives for respectively techs.

