#!/bin/sh

export GOPATH=$PWD

go get -u -d github.com/bpcreech/hugohook/cmd/hugohook-server
go get -u -d github.com/gohugoio/hugo

docker run --rm -v "$PWD":/go -w /go iron/go:dev go build github.com/bpcreech/hugohook/cmd/hugohook-server
docker run --rm -v "$PWD":/go -w /go iron/go:dev go build github.com/gohugoio/hugo

docker build -t bpcreech/hugohook:1.0 . -f Dockerfile
