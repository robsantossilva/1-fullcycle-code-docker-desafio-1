FROM golang:1.15-alpine as builder

WORKDIR /go/src/app

COPY . .

RUN go build -ldflags "-w" main.go

FROM scratch

COPY --from=builder /go/src/app/main .

CMD [ "./main" ]