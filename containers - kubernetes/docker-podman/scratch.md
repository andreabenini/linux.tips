# Container image from scratch
an explicitly empty image, especially for building images "FROM scratch".  
This looks like a nice idea to generate empty images and add packages later even if directly adding
go/c binaries and create an image for them seems to be more feasible to me. Even 
[multistage builds](multistage.build.md) are more interesting.

btw, here are some references:
- https://hub.docker.com/_/scratch  
- https://docs.docker.com/build/building/base-images/#creating-a-simple-parent-image-using-scratch

and using it it's just a matter of creating a `Containerfile` like:
```Containerfile
FROM scratch
COPY hello /
CMD ["/hello"]
```
