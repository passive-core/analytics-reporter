FROM golang:1.21-alpine AS builder
WORKDIR /app
COPY . .
RUN go build -o analytics-reporter ./cmd/analytics-reporter

FROM gcr.io/distroless/base
COPY --from=builder /app/analytics-reporter /analytics-reporter
ENTRYPOINT ["/analytics-reporter"]
