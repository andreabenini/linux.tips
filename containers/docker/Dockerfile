FROM python:3.7-alpine as base
FROM base as builder

RUN mkdir /hellohttp
WORKDIR /hellohttp
ADD hellohttp.py /hellohttp
EXPOSE 7070
CMD ["python", "/hellohttp/hellohttp.py"]
