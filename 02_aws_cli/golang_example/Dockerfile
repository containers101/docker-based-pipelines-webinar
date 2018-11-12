FROM golang:1.7.1
COPY src /go/src
RUN go build -o bin/sample src/sample/trivial-web-server.go
EXPOSE 8080
CMD ["/go/bin/sample"]
