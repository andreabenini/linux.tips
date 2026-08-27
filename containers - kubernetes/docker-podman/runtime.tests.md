# Creating containers on the fly for quick runtime tests
Documenting quick and dirty shortcuts and commands for having tmp containers and executing random software from untrusted sources

# nodejs
NodeJS is a synonym of untrusted sources, expecially when you pick up the latest and the greatest random project from github, to keep it segregated this might be a nice example:
```sh
podman run --rm -it \
  --user 0 \
  --userns keep-id                    # Run under a distinct subuid/subgid namespace mapping    \
  --workdir /home/node \
  -p 127.0.0.1:3000:3000              # Map internal TCP:3000 to external TCP:3000 \
  --cap-drop=ALL                      # Drop all kernel privileges \
  --cap-add=SETUID,SETGID \
  --security-opt no-new-privileges    # Block privilege escalation binaries (setuid/setgid) \
  --cpus="1.0"                        # Limit CPU and Memory to stop fork bombs and resource exhaustion \
  --memory="512m" \
  node:20-alpine sh

## Other useful flags
# Complete network isolation (no internet, no access to host networks)
#   --network none
# Read-only filesystem to block unauthorized writes
#   --read-only
# Memory-backed temporary storage for temporary files and dependencies
#   --tmpfs /tmp:rw,noexec,nosuid
#   --tmpfs /home/node/app/node_modules:rw
# Prevent access to host devices
#   --device=""
# Mount test code into the container strictly as read-only
#   -v "$(pwd)":/home/node/app:ro
```
