# CURL HTTP POST
curl \
    --header "Authorization: key=AIzaSyAJdz6YkUNwb6lWtsyBV3XfhqldVHGUqtQ" \
    --header Content-Type:"application/json" https://gcm-http.googleapis.com/gcm/send \
    -d "{\"registration_ids\":[\"fARzJ0ysrZIxHpYSSg6wZTfURcuKwEGdCl0bku7n\"],\"data\":{\"title\":\"My Cool Title\"} }"
