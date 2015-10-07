FROM busybox:latest

ADD https://github.com/upfluence/vulcand-auth/releases/download/v0.0.3/vulcand-linux-amd64 /vulcand

RUN echo $GOPATH
ADD . /go/src/m3n-vulcand/
RUN ls $GOPATH
RUN vbundle init --middleware=m3n-vulcand/auth
EXPOSE 8181 8182

RUN make install

ENTRYPOINT ["/go/bin/vulcand"]