# Create a random file
```sh
# Use openssl instead of /dev/random because its faster
# (* 3/4) thing it's because base64 adds some overhead

# Create 1Kb file
openssl rand -out sample.txt -base64 $((1008 * 3/4))

# Create 10Kb file
openssl rand -out sample.txt -base64 $((10080 * 3/4))

# Create 100Kb file
openssl rand -out sample.txt -base64 $((100800 * 3/4))

# Create 1Mb file
openssl rand -out sample.txt -base64 $((1032000 * 3/4))

```

# Create a bunch of files (100k each)
```sh
# One liner
for n in {1..10}; do openssl rand -out $(printf %03d "$n").txt -base64 $((100800 * 3/4)); done

# Same on more lines
for n in {1..10}; do
    openssl rand -out $(printf %03d "$n").txt -base64 $((100800 * 3/4))
done
```
