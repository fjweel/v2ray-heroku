FROM alpine:3.11
RUN apk update
RUN apk upgrade
RUN apk add --no-cache --virtual .build-deps ca-certificates git curl iptables bash gcc libtool autoconf automake make asciidoc xmlto g++ cmake
RUN git clone https://github.com/ShadowsocksR-Live/shadowsocksr-native.git
RUN mv shadowsocksr-native ssr-n
RUN cd ssr-n
RUN git submodule update --init
RUN git submodule foreach -q 'git checkout $(git config -f $toplevel/.gitmodules submodule.$name.branch || echo master)'
RUN mkdir build && cd build
RUN cmake .. && make
ADD /v2/v2ray /v2/v2ray
RUN chmod +x /v2/v2ray

ADD /v2/v2ctl /v2/v2ctl
RUN chmod +x /v2/v2ctl

ADD configure.sh /configure.sh
RUN chmod +x /configure.sh

CMD /configure.sh
