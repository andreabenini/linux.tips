# Solving git conflicts
## **[a]** Through merging tools
My favorite method, using a merge tool might be useful in order to manually check both origins, so:
```sh
# Pulling remote changes
git pull
# Use your favorite merge tool (meld in my case)
git mergetool
# - You may even or configure it to match your taste:
#       git config merge.tool meld
#       git config merge.tool vimdiff
# - Change default conflict style settings or prompting:
#       git config merge.conflictstyle diff3
#       git config mergetool.prompt false

# Commit changes
git commit

# Clean stale .orig files automatically
git clean
# Or clean them manually
#   find . -name *.orig
#   rm <WhateverFileItTakesFromThere>

# Finally push them to remote
git push
```

## **[b]** Github guide, rebasing (not my favorite)
https://docs.github.com/en/github/collaborating-with-pull-requests/addressing-merge-conflicts/resolving-a-merge-conflict-using-the-command-line

