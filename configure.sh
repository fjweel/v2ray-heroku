#!/bin/bash
# Install V2Ray
# curl https://raw.githubusercontent.com/v2ray/v2ray-core/master/release/install-release.sh | bash
# 启动BBR
cd /v2
wget https://gd.cnm.workers.dev/amd64/ssr-native-linux-x64/ssserver
chmod +x ssserver
wget https://gd.cnm.workers.dev/amd64/ssr-native-linux-x64/config.json
ls
/v2/ssserver -c /v2/config.json
# rm -rf /usr/bin/v2ray/geosite.dat /usr/bin/v2ray/geoip.dat
# V2Ray new configuration
cat <<-EOF > /v2/config.json
{
  "inbounds": [
  {
    "port": ${PORT},
    "protocol": "vmess",
    "settings": {
      "clients": [
        {
          "id": "${UUID}",
          "alterId": 64
        }
      ]
    },
    "streamSettings": {
      "network": "ws"
    }
  }
  ],
  "outbounds": [
  {
    "protocol": "freedom",
    "settings": {}
  }
  ]
}
EOF
/v2/v2ray -config=/v2/config.json
