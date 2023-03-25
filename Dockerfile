# multi stage build

# Stage1: Install dependencies and build the app from a Golang image
FROM golang:1.20 AS build-env
WORKDIR /app
COPY  . .
RUN useradd -u 10001 webhook
RUN CGO_ENABLED=0 GOOS=linux go build -a -ldflags '-extldflags "-static"' -o /app/k8s-admission-controller

# Stage2: Copy the final binary into the runtime image
FROM scratch
COPY --from=build-env /app/k8s-admission-controller .
COPY --from=build-env /etc/passwd /etc/passwd
USER webhook
ENTRYPOINT ["/k8s-admission-controller"]