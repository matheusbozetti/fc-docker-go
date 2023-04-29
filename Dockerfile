FROM golang:alpine3.17 as builder

WORKDIR /usr/src/app

COPY . .

RUN go build -o ./build main.go

## Copy to a smaller image

FROM scratch

WORKDIR /

COPY --from=builder /usr/src/app/build ./build

ENTRYPOINT ["./build"];
