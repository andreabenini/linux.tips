# Set or configure variables
- `Settings > CI/CD > Variables`, Store variables in there
- Type: `Variable / File`. Use *File* for everything like binaries or hashes or structs, *Variable* for everything else that's common
- *Visible* (Can be seen in job logs), *Masked* (Masked in job logs but value can be revealed in CI/CD settings), *Masked and hidden* (Masked in job logs, and can never be revealed in the CI/CD settings after the variable is saved)

## Tips:
### Store SSH Keys
> Unable to create masked variable because:
> The value cannot contain the following characters: whitespace characters.

Means exactly what's written; you simply cannot store whitespaces in a variable of type *File*. To avoid this limitation it might be just a matter of:
```sh
cat ~/.ssh/your_private_key | base64 -w 0
```
on the host side, take that value and store it into the var instead of the original one. You need to expand it back later with something like:
```sh
echo "$PRIVATE_KEY_B64" | base64 -d
```

### Use CI/CD variables as light secrets
```sh
echo '$YOUR_GITLAB_ENV_VAR' | base64 --decode | tr -d '\r' > ~/your.decoded.env.var
```
