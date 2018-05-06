## Moving a dir by syncing it
When moving a new directory over an existing one you'll face this kind of error:
```
mv resources ../../
mv: cannot move 'resources' to '../../resources': Directory not empty
```
**mv** cannot solve it nicely but instead you can avoid troubles by doing this:
```
rsync -a resources/ ../../resources/
rm -r resources/    # And later on you can remove new one
```
