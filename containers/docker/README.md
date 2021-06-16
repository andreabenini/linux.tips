# 30s getting started
Login
```sh
docker login
```
build
```sh
docker build -t andreabenini/hello.tests .
```
run
```sh
docker run --rm -it --name helloHTTP -p 8080:7070 andreabenini/hello.tests
```
push
```sh
docker push andreabenini/hello.tests
```
