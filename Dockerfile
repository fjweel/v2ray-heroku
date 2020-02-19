FROM alpine:latest
RUN apk update
RUN apk add --no-cache --virtual .build-deps ca-certificates curl rclone bash
ADD configure.sh /configure.sh
RUN chmod +x /configure.sh
CMD /configure.sh
