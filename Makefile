
build:
	go build -a -tags netgo -installsuffix cgo -ldflags '-w' -o ./vulcand .
	go build -a -tags netgo -installsuffix cgo -ldflags '-w' -o ./vctl/vctl ./vctl
	

docker-build:
	export GO15VENDOREXPERIMENT=1
	GOOS=linux CGO_ENABLED=0 GOARCH=amd64 go build -o vulcand-linux-amd64 .
	GOOS=linux CGO_ENABLED=0 GOARCH=amd64 go build -o ./vctl/vctl-linux-amd64 ./vctl
	docker build -t mag3llandevops/m3n-vulcand:latest -f ./Dockerfile .


