FROM golang:alpine
MAINTAINER xtaci <daniel820313@gmail.com>
RUN apk update && \
    apk upgrade && \
    apk add git
VOLUME /root
RUN go get github.com/xtaci/kcptun/client && go get github.com/xtaci/kcptun/server
EXPOSE 29900/udp
EXPOSE 12948
COPY client.json /root/client.json
CMD /go/bin/client -c /root/client.json
