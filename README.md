# Timezone issue in Go and Docker

## Issue
`time.In(loc)` raises issue running in Docker container
```bash
panic: time: missing Location in call to Time.In

goroutine 1 [running]:
time.Time.In(...)
        /usr/local/go/src/time/time.go:1120
main.main()
        /go/src/go-docker-timezone/main.go:14 +0x21a
```

## Cause

`scratch` image (used to run Go built binary file) lacks of tzdata package.

## Solution

Copy timezone information from tzdata package to container (used to run binary file). Refer to Docker file for detail.

## Commands to run example

```bash
# Build docker image
$ docker build -t gotz .
# Run docker image
$ docker run gotz
```
Expected result

```none
Corresponding timestring for timestamp 1559732849 in tz 'Asia/Ho_Chi_Minh': 2019-06-05T18:07:29+07:00
```
