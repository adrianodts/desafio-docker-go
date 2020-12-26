FROM golang AS builder
WORKDIR /app
COPY /app .
RUN go build -o main -ldflags="-s -w"

FROM scratch
WORKDIR /app
COPY --from=builder /app/main .

ENTRYPOINT [ "./main" ]