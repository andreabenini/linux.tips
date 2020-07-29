# CURL HTTP POST

## HTTP GET, generic
```
# Generic request, just like wget.  (v)erbose, (s)ilent, suppress progress bar meter
curl -vs http://remote.http.site
```

## HTTP Form POST
```
curl \
    --header "Authorization: key=AIzaSyAJdz6YkUNwb6lWtsyBV3XfhqldVHGUqtQ" \
    --header Content-Type:"application/json" https://gcm-http.googleapis.com/gcm/send \
    -d "{\"registration_ids\":[\"fARzJ0ysrZIxHpYSSg6wZTfURcuKwEGdCl0bku7n\"],\"data\":{\"title\":\"My Cool Title\"} }"
```

## HTTP Form POST JSON data
```
curl -d '{"key1":"value1", "key2":"value2"}' -H "Content-Type: application/json" -X POST http://localhost/form
```

## HTTP Upload file
```
# As a multipart    (multipart/form-data)
curl -F "file=@filename.txt;filename=NameOfTheFileInPOST.txt" "http://remote.http.site/upload"

# As a binary file  (application/x-www-form-urlencoded)
curl --request POST --data-binary "@bigfile.img" "http://remote.http.site/upload"
```

## HTTPS various options (example: insecure mode)
To force specific curl options, like insecure mode (do not care about untrusted certs) you might edit your `$HOME/.curlrc` file.
for example:
```
insecure
```
in your `.curlrc` file and everything is fine.
