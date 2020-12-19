FROM golang AS builder
WORKDIR /app
COPY /app .
RUN go build -o main

FROM scratch
WORKDIR /app
COPY --from=builder /app/main .

ENTRYPOINT [ "./main" ]