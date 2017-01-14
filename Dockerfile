FROM golang:1.7.1-alpine
MAINTAINER andres <andres.lee4fun@gmail.com>
RUN apk update && \
    apk upgrade && \
    apk add git
RUN go get github.com/xtaci/kcptun/server
RUN go get -u github.com/cybozu-go/usocksd/...
EXPOSE 20008/udp

ADD app.sh ./
ADD usocksd.toml ./
ADD kcptun.json ./
RUN chmod a+x /app.sh
ENTRYPOINT ./app.sh
