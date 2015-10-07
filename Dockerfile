FROM busybox

EXPOSE 8181 8182

COPY vulcand-linux-amd64 /app/vulcand
COPY ./vctl/vctl-linux-amd64 /app/vctl
ENV PATH=/app:$PATH

ENTRYPOINT ["/app/vulcand"]
CMD ["-etcd=http://127.0.0.1:4001", "-etcd=127.0.0.1:4002", "-etcd=127.0.0.1:4003", "-sealKey=1b727a055500edd9ab826840ce9428dc8bace1c04addc67bbac6b096e25ede4b"]