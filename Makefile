.PHONY: test build

test:
	GOEXPERIMENT=loopvar go test ./... -race -covermode=atomic -coverprofile=coverage.out

build:
	GOEXPERIMENT=loopvar CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-w -s -X main.buildSha=`git rev-parse HEAD` -X main.buildTime=`date +'%Y-%m-%d_%T'`"
