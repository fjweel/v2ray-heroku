FROM alpine:latest
RUN apk update
RUN apk upgrade
RUN apk add --no-cache --virtual .build-deps ca-certificates git curl bash unzip


ADD configure.sh /configure.sh
RUN chmod +x /configure.sh

CMD /configure.sh
