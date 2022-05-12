FROM golang:1.18.2-alpine3.14

RUN apk add make gcc libc-dev

COPY ["./go.mod", "./go.sum" ,"Makefile","/app/"]

WORKDIR /app

RUN GORPOXY=https://goproxy.io make install

ENTRYPOINT ["make","serve"]