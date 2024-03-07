#!/bin/bash
if [[ $(ulimit -c) != "0" ]]; then
  echo "Im Watching You..."
  echo "- @mansurrshop"
  exit 1
fi

red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
IP=$(curl -sS ipinfo.io/ip > /tmp/ipaddress.txt)
MYIP=$(cat /tmp/ipaddress.txt)
if [ -z "$MYIP" ]; then
IP=$(curl -sS http://ip-api.com/json | jq .query | tr -d '"' > /tmp/ipaddress.txt)
MYIP=$(cat /tmp/ipaddress.txt)
fi
if [ -z "$MYIP" ]; then
IP=$(curl -sS ipinfo.io | jq .ip | tr -d '"' > /tmp/ipaddress.txt)
MYIP=$(cat /tmp/ipaddress.txt)
fi

# cek wget & curl
if ! which wget > /dev/null; then
clear
echo -e "${red}Wah Mau Belajar Nakal Yah !${NC}"
sleep 2
exit 0
clear
else
echo "Wget is already installed"
fi

if ! which curl > /dev/null; then
clear
echo -e "${red}Wah Mau Belajar Nakal Yah !${NC}"
sleep 2
exit 0
clear
else
echo "curl is already installed"
fi

fileee=/usr/bin/wget
minimumsize=400000
actualsize=$(wc -c <"$fileee")
if [ $actualsize -ge $minimumsize ]; then
clear
echo -e "${green}Checking...${NC}"
else
clear
echo -e "${red}Permission Denied!${NC}";
echo "Reason : Modified Package To Bypass Sc"
exit 0
fi

fileeex=/usr/bin/curl
minimumsizex=15000
clear
actualsizex=$(wc -c <"$fileeex")
if [ $actualsizex -ge $minimumsizex ]; then
clear
echo -e "${green}Checking...${NC}"
else
clear
echo -e "${red}Permission Denied!${NC}";
echo "Reason : Modified Package To Bypass Sc"
exit 0
fi

# data server
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
cekcloudflare=$(curl -sS http://ip-api.com/json | jq .as | grep -o "Cloudflare")
if [[ "$cekcloudflare" = "Cloudflare" ]]; then
cekdomen=$(cat /etc/xray/domain)
MYIP=$(dig +short "$cekdomen" | head -n 1)
fi
repogithub='MansurShop/AutoscriptV1/main'
repopermission='https://raw.githubusercontent.com/MansurShop/Permission/main/permission.txt'
repopermission2='https://raw.githubusercontent.com/MansurShop/Permission/main/permission.txt'
repopermission3='https://raw.githubusercontent.com/MansurShop/Permission/main/permission.txt'
curl -sS -H 'Cache-Control: no-cache, no-store' $repopermission | grep -w "$MYIP" > /tmp/logs.txt
Master1=$(cat /tmp/logs.txt)
if [ -z "$Master1" ]
then
curl -sS -H 'Cache-Control: no-cache, no-store' $repopermission2/$MYIP > /tmp/logs.txt
fi
Master2=$(cat /tmp/logs.txt)
if [ -z "$Master2" ]
then
curl -sS -H 'Cache-Control: no-cache, no-store' $repopermission3/$MYIP > /tmp/logs.txt
fi
# cek masa aktif
data=( `cat /tmp/logs.txt | grep -E "^### " | awk '{print $2}'` )
for user in "${data[@]}"
do
exp=( `grep -E "^### $data" "/tmp/logs.txt" | awk '{print $3}' | sort | uniq` )
d1=(`date -d "$exp" +%s`)
d2=(`date -d "$biji" +%s`)
exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp2" -le "0" ]]; then
echo -e "${red}Script Expired !${NC}"
echo -e "Contact Admin : t.me/mansurrshop"
rm -rf /tmp/logs.txt
rm -rf /tmp/ipaddress.txt
exit 1
else
echo -e "${green}Script Active !${NC}"
clear
fi
done

# cek ip address
checkipaddres=( `grep -E "^### $data" "/tmp/logs.txt" | awk '{print $4}' | sort | uniq` )
if [[ "$MYIP" = "$checkipaddres" ]]; then
echo -e "${green}IP Address Accepted${NC}"
clear
else
echo -e "${red}IP Address Not Found In Our Database${NC}"
echo -e "Contact Admin : t.me/mansurrshop"
rm -rf /tmp/logs.txt
rm -rf /tmp/ipaddress.txt
exit 1
fi

# cek client name
clientname=$(cat /usr/local/etc/clientname)
checkclient=( `grep -E "^### $data" "/tmp/logs.txt" | awk '{print $2}' | sort | uniq` )
if [[ "$clientname" = "$checkclient" ]]; then
echo -e "${green}Client Name Accepted${NC}"
clear
else
echo -e "${red}Client Name Not Compatible !${NC}"
echo -e "Contact Admin : t.me/mansurrshop"
rm -rf /tmp/logs.txt
rm -rf /tmp/ipaddress.txt
exit 1
fi
rm -rf /tmp/logs.txt
rm -rf /tmp/ipaddress.txt
clear

domain=$(cat /etc/xray/domain)
uuid=$(cat /proc/sys/kernel/random/uuid)
# custom path
trojan_ws_path="/trojanws"
vless_ws_path="/vlessws"
vmess_tcp_path="/vmesstcp"
vmess_ws_path="/vmessws"
ss_ws_path="/ssws"
trojan_grpc_path="trojangrpc"
vless_grpc_path="vlessgrpc"
vmess_grpc_path="vmessgrpc"
mkdir -p /etc/xray/path/
touch /etc/xray/path/trojan_ws_path
touch /etc/xray/path/vless_ws_path
touch /etc/xray/path/vmess_tcp_path
touch /etc/xray/path/vmess_ws_path
touch /etc/xray/path/ss_ws_path
touch /etc/xray/path/trojan_grpc_path
touch /etc/xray/path/vless_grpc_path
touch /etc/xray/path/vmess_grpc_path
echo $trojan_ws_path > /etc/xray/path/trojan_ws_path
echo $vless_ws_path > /etc/xray/path/vless_ws_path
echo $vmess_tcp_path > /etc/xray/path/vmess_tcp_path
echo $vmess_ws_path > /etc/xray/path/vmess_ws_path
echo $ss_ws_path > /etc/xray/path/ss_ws_path
echo $trojan_grpc_path > /etc/xray/path/trojan_grpc_path
echo $vless_grpc_path > /etc/xray/path/vless_grpc_path
echo $vmess_grpc_path > /etc/xray/path/vmess_grpc_path

#vlessxtls
cat > "/etc/systemd/system/will666.service" << EOF
[Unit]
Description=Xray Service
Documentation=https://github.com/xtls
After=network.target nss-lookup.target

[Service]
User=nobody
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/local/bin/xray run -config /usr/local/etc/xray/will666.json
Restart=on-failure
RestartPreventExitStatus=23
LimitNPROC=10000
LimitNOFILE=1000000

[Install]
WantedBy=multi-user.target
EOF

#trojan
cat > "/etc/systemd/system/will69.service" << EOF
[Unit]
Description=Xray Service
Documentation=https://github.com/xtls
After=network.target nss-lookup.target

[Service]
User=nobody
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/local/bin/xray run -config /usr/local/etc/xray/will69.json
Restart=on-failure
RestartPreventExitStatus=23
LimitNPROC=10000
LimitNOFILE=1000000

[Install]
WantedBy=multi-user.target
EOF

cat > /usr/local/etc/xray/will666.json << END
{
  "log": {
    "access": "/var/log/xray/access.log",
    "error": "/var/log/xray/error.log",
    "loglevel": "info"
  },
  "inbounds": [
    {
      "listen": "127.0.0.1",
      "port": 10085,
      "protocol": "dokodemo-door",
      "settings": {
        "address": "127.0.0.1"
      },
      "tag": "api"
    },
        {
            "port": 1369,
            "protocol": "vless",
            "settings": {
                "clients": [
                    {
                        "id": "$uuid",
                        "flow": "xtls-rprx-direct",
                        "level": 0,
                        "email": "user"
                    }
#vlessxtls
                ],
                "decryption": "none",
                "fallbacks": [
                    {
                        "dest": 1310,
                        "xver": 1
                    },
                    {
                        "alpn": "h2",
                        "dest": 31302,
                        "xver": 1
                    },
                    {
                        "path": "$trojan_ws_path",
                        "dest": 1320,
                        "xver": 1
                    },
                    {
                        "path": "$vless_ws_path",
                        "dest": 1234,
                        "xver": 1
                    },
                    {
                        "path": "$vmess_tcp_path",
                        "dest": 2345,
                        "xver": 1
                    },
                    {
                        "path": "$vmess_ws_path",
                        "dest": 3456,
                        "xver": 1
                    },
                    {
                        "path": "$ss_ws_path",
                        "dest": 6789,
                        "xver": 1
                    }
                ]
            },
            "streamSettings": {
                "network": "tcp",
                "security": "xtls",
                "xtlsSettings": {
                    "alpn": [
                        "h2",
                        "http/1.1"
                    ],
                    "certificates": [
                        {
                            "certificateFile": "/etc/ssl/private/fullchain.pem",
                            "keyFile": "/etc/ssl/private/privkey.pem",
                            "ocspStapling": 3600,
                            "usage":"encipherment"
                        }
                    ]
                }
            }
        }
   ],
  "outbounds": [
    {
      "protocol": "freedom",
      "settings": {}
    },
    {
      "protocol": "blackhole",
      "settings": {},
      "tag": "blocked"
    }
  ],
  "routing": {
    "rules": [
      {
        "type": "field",
        "ip": [
          "0.0.0.0/8",
          "10.0.0.0/8",
          "100.64.0.0/10",
          "169.254.0.0/16",
          "172.16.0.0/12",
          "192.0.0.0/24",
          "192.0.2.0/24",
          "192.168.0.0/16",
          "198.18.0.0/15",
          "198.51.100.0/24",
          "203.0.113.0/24",
          "::1/128",
          "fc00::/7",
          "fe80::/10"
        ],
        "outboundTag": "blocked"
      },
      {
        "inboundTag": [
          "api"
        ],
        "outboundTag": "api",
        "type": "field"
      },
      {
        "type": "field",
        "outboundTag": "blocked",
        "protocol": [
          "bittorrent"
        ]
      }
    ]
  },
  "stats": {},
  "api": {
    "services": [
      "StatsService"
    ],
    "tag": "api"
  },
  "policy": {
    "levels": {
      "0": {
        "statsUserDownlink": true,
        "statsUserUplink": true
      }
    },
    "system": {
      "statsInboundUplink": true,
      "statsInboundDownlink": true,
      "statsOutboundUplink" : true,
      "statsOutboundDownlink" : true
    }
  }
}
{
  "outbounds": [
    {
      "protocol": "dns",
      "tag": "dns-out"
    },
    {
      "streamSettings": {
        "sockopt": {
          "mark": 255
        }
      },
      "settings": {
        "domainStrategy": "UseIPv4"
      },
      "protocol": "freedom",
      "tag": "direct"
    },
    {
      "protocol": "blackhole",
      "tag": "blackhole"
    },
    {
      "settings": {
        "servers": [
          {
            "port": 10085,
            "address": "127.0.0.1"
          }
        ]
      },
      "streamSettings": {
        "network": "tcp",
        "security": "none"
      },
      "protocol": "socks",
      "tag": "out"
    }
  ],
  "log": {
    "loglevel": "warning"
  },
  "dns": {
    "hosts": {
      "dns.tiarap": "174.138.21.128",
      "dns.1host": "76.76.2.38",
      "geosite:category-ads-all": "127.0.0.1"
    },
    "servers": [
      {
        "address": "https://doh.tiarap.org/dns-query",
        "domains": ["geosite:geolocation-!cn"],
        "expectIPs": ["geoip:!cn"]
      },
      "174.138.21.128",
      {
        "address": "174.138.21.128",
        "port": 53,
        "domains": ["geosite:id", "geosite:category-games@id"],
        "expectIPs": ["geoip:id"],
        "skipFallback": true
      },
      {
        "address": "localhost",
        "skipFallback": true
      }
    ]
  },
  "routing": {
    "rules": [
      {
        "type": "field",
        "outboundTag": "Reject",
        "domain": ["geosite:category-ads-all"]
      },
      {
        "type": "field",
        "outboundTag": "Direct",
        "domain": [
          "geosite:private",
          "geosite:apple-id",
          "geosite:google-id",
          "geosite:tld-id",
          "geosite:category-games@id"
        ]
      },
      {
        "type": "field",
        "outboundTag": "Proxy",
        "domain": ["geosite:geolocation-!cn"]
      },
      {
        "type": "field",
        "outboundTag": "Direct",
        "domain": ["geosite:id"]
      },
      {
        "type": "field",
        "outboundTag": "Proxy",
        "network": "tcp,udp"
      }
    ]
  },
  "inbounds": [
    {
      "port": 10085,
      "protocol": "dokodemo-door",
      "settings": {
        "port": 53,
        "network": "udp",
        "address": "174.138.21.128"
      },
      "tag": "dns-in",
      "listen": "127.0.0.1"
    }
  ]
}
END

cat > /usr/local/etc/xray/will69.json << END
{
  "log": {
    "access": "/var/log/xray/access.log",
    "error": "/var/log/xray/error.log",
    "loglevel": "info"
  },
  "inbounds": [
    {
      "listen": "127.0.0.1",
      "port": 10085,
      "protocol": "dokodemo-door",
      "settings": {
        "address": "127.0.0.1"
      },
      "tag": "api"
    },
        {
            "port": 1310,
            "listen": "127.0.0.1",
            "protocol": "trojan",
            "settings": {
                "clients": [
                    {
                        "password": "$uuid",
                        "level": 0,
                        "email": "user"
                    }
#trojantcp
                ],
                "fallbacks": [
                    {
                        "dest": 2052
                    }
                ]
            },
            "streamSettings": {
                "network": "tcp",
                "security": "none",
                "tcpSettings": {
                    "acceptProxyProtocol": true
                }
            }
        }
        ],
  "outbounds": [
    {
      "protocol": "freedom",
      "settings": {}
    },
    {
      "protocol": "blackhole",
      "settings": {},
      "tag": "blocked"
    }
  ],
  "routing": {
    "rules": [
      {
        "type": "field",
        "ip": [
          "0.0.0.0/8",
          "10.0.0.0/8",
          "100.64.0.0/10",
          "169.254.0.0/16",
          "172.16.0.0/12",
          "192.0.0.0/24",
          "192.0.2.0/24",
          "192.168.0.0/16",
          "198.18.0.0/15",
          "198.51.100.0/24",
          "203.0.113.0/24",
          "::1/128",
          "fc00::/7",
          "fe80::/10"
        ],
        "outboundTag": "blocked"
      },
      {
        "inboundTag": [
          "api"
        ],
        "outboundTag": "api",
        "type": "field"
      },
      {
        "type": "field",
        "outboundTag": "blocked",
        "protocol": [
          "bittorrent"
        ]
      }
    ]
  },
  "stats": {},
  "api": {
    "services": [
      "StatsService"
    ],
    "tag": "api"
  },
  "policy": {
    "levels": {
      "0": {
        "statsUserDownlink": true,
        "statsUserUplink": true
      }
    },
    "system": {
      "statsInboundUplink": true,
      "statsInboundDownlink": true,
      "statsOutboundUplink" : true,
      "statsOutboundDownlink" : true
    }
  }
}
{
  "outbounds": [
    {
      "protocol": "dns",
      "tag": "dns-out"
    },
    {
      "streamSettings": {
        "sockopt": {
          "mark": 255
        }
      },
      "settings": {
        "domainStrategy": "UseIPv4"
      },
      "protocol": "freedom",
      "tag": "direct"
    },
    {
      "protocol": "blackhole",
      "tag": "blackhole"
    },
    {
      "settings": {
        "servers": [
          {
            "port": 10085,
            "address": "127.0.0.1"
          }
        ]
      },
      "streamSettings": {
        "network": "tcp",
        "security": "none"
      },
      "protocol": "socks",
      "tag": "out"
    }
  ],
  "log": {
    "loglevel": "warning"
  },
  "dns": {
    "hosts": {
      "dns.tiarap": "174.138.21.128",
      "dns.1host": "76.76.2.38",
      "geosite:category-ads-all": "127.0.0.1"
    },
    "servers": [
      {
        "address": "https://doh.tiarap.org/dns-query",
        "domains": ["geosite:geolocation-!cn"],
        "expectIPs": ["geoip:!cn"]
      },
      "174.138.21.128",
      {
        "address": "174.138.21.128",
        "port": 53,
        "domains": ["geosite:id", "geosite:category-games@id"],
        "expectIPs": ["geoip:id"],
        "skipFallback": true
      },
      {
        "address": "localhost",
        "skipFallback": true
      }
    ]
  },
  "routing": {
    "rules": [
      {
        "type": "field",
        "outboundTag": "Reject",
        "domain": ["geosite:category-ads-all"]
      },
      {
        "type": "field",
        "outboundTag": "Direct",
        "domain": [
          "geosite:private",
          "geosite:apple-id",
          "geosite:google-id",
          "geosite:tld-id",
          "geosite:category-games@id"
        ]
      },
      {
        "type": "field",
        "outboundTag": "Proxy",
        "domain": ["geosite:geolocation-!cn"]
      },
      {
        "type": "field",
        "outboundTag": "Direct",
        "domain": ["geosite:id"]
      },
      {
        "type": "field",
        "outboundTag": "Proxy",
        "network": "tcp,udp"
      }
    ]
  },
  "inbounds": [
    {
      "port": 10085,
      "protocol": "dokodemo-door",
      "settings": {
        "port": 53,
        "network": "udp",
        "address": "174.138.21.128"
      },
      "tag": "dns-in",
      "listen": "127.0.0.1"
    }
  ]
}
END

systemctl enable will666
systemctl start will666
systemctl restart will666
systemctl enable will69
systemctl start will69
systemctl restart will69