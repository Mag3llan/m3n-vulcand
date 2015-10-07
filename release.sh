#!/bin/sh

version=$1

git tag v$version

GOOS=linux CGO_ENABLED=0 GOARCH=amd64 go build -o vulcand-linux-amd64 .
GOOS=darwin CGO_ENABLED=0 GOARCH=amd64 go build -o vulcand-darwin-amd64 .

hub release create -a vulcand-linux-amd64 -a vulcand-darwin-amd64 v$version