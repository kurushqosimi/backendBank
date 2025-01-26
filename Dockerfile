# Build stage
FROM golang:1.22.2-alpine AS builder

WORKDIR /app

COPY . .

RUN go build -o main main.go

# Run stage
FROM alpine

WORKDIR /app

COPY --from=builder /app/main .
COPY app.env .

CMD ["/app/main"]

EXPOSE 8080