# Easy HelloWorld http test
From public dockerhub image

#### Login
```sh
docker login
```
#### build
```sh
docker build -t andreabenini/hello.tests .
```
#### run
```sh
docker run --rm -it --name helloHTTP -p 8080:7070 andreabenini/hello.tests
```
#### push
```sh
docker push andreabenini/hello.tests
```


#Links
- TOP Docker commands with examples  
    https://devangtomar.medium.com/top-docker-commands-with-examples-that-you-should-know-59213db0ab1e
