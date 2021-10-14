# Delete a stucked namespace:
(reference: https://stackoverflow.com/questions/52369247/namespace-stuck-as-terminating-how-do-i-remove-it/57726448)
---
There's probably something stuck in between or something still used by someone else. It's seems to be a nice thing to delete it anyway.
```sh
# Method 1
kubectl api-resources --verbs=list --namespaced -o name | xargs -n 1 kubectl get --show-kind --ignore-not-found -n <namespace>
# Method 2
kubectl get namespace "stucked-namespace" -o json | tr -d "\n" | sed "s/\"finalizers\": \[[^]]\+\]/\"finalizers\": []/" \
  | kubectl replace --raw /api/v1/namespaces/stucked-namespace/finalize -f -
```
