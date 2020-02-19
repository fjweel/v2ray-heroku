FROM alpine:3.5
RUN apk update
RUN apk add --no-cache --virtual .build-deps ca-certificates curl bash
ADD /v2/v2ray /v2/v2ray
RUN chmod +x /v2/v2ray
ADD configure.sh /configure.sh
RUN chmod +x /configure.sh
CMD /configure.sh
