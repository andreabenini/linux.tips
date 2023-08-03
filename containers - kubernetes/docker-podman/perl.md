Installing cpan libraries from Dockerfile/Containerfile
```sh
# CPAN software installation
RUN cpanm JSON
RUN cpanm JSON::Create
RUN cpanm boolean

# CPAN automatic configuration fix, (what cpan autoconfigures on the first run)
RUN (echo y;echo o conf prerequisites_policy follow;echo o conf commit)|cpan

```
