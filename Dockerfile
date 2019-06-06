FROM golang:1.12.5 as builder

# copy source
WORKDIR /go/src/go-docker-timezone
COPY . .

# build the binary
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o gotz

FROM scratch
# Copy timezone
COPY --from=builder /usr/share/zoneinfo /usr/share/zoneinfo
COPY --from=builder /go/src/go-docker-timezone/gotz /gotz
ENTRYPOINT ["/gotz"]
