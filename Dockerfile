FROM golang:1.16-alpine AS builder

WORKDIR /go/src
COPY /main.go .
RUN GOOS=linux go build main.go

FROM scratch
WORKDIR /go/src
COPY --from=builder /go/src/main ./

ENTRYPOINT [ "./main" ]