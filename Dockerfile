FROM debian:stable-slim
RUN apt-get update && apt-get install -y ca-certificates iptables curl bash

#RUN apk add --no-cache --virtual .build-deps ca-certificates curl bash

ADD /v2/v2ray /v2/v2ray
RUN chmod +x /v2/v2ray

ADD /v2/v2ctl /v2/v2ctl
RUN chmod +x /v2/v2ctl

ADD configure.sh /configure.sh
RUN chmod +x /configure.sh

CMD /configure.sh
