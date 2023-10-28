.PHONY:

NPROC=$(shell grep -c 'processor' /proc/cpuinfo)
MAKEFLAGS+=-j$(NPROCS)

TAG=$(shell git describe --tags)
TARGET_DIR=bin
TARGET=$(TARGET_DIR)/crypt0
root=$(shell go env GORROT)

fmt:
	@gofmt -l -w ./..

test:
	go test -race -v $(shell go list ./... | grep -v /cmd | grep -v /runtime)

cli:
	GO111MODULE=on CGO_ENABLED=1 GOOS=linux GOARCH=amd64 go build \
	 -ldflags "-s -w -X github.com/open-zhy/crypt0/core.Version=$(TAG)" \
	 -o $(TARGET) ./main.go

wasi:
	GO111MODULE=on CGO_ENABLED=0 GOOS=wasip1 GOARCH=wasm go build \
	 -ldflags "-s -w -X github.com/open-zhy/crypt0/core.Version=$(TAG)" \
	 -o $(TARGET) ./main.go	 