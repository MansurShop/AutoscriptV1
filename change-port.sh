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

tls="$(cat ~/log-install.txt | grep -w "XRAY TLS" | cut -d: -f2|sed 's/ //g')"
ws="$(cat ~/log-install.txt | grep -w "SSHWS" | cut -d: -f2|sed 's/ //g')"
vmnone="$(cat ~/log-install.txt | grep -w "VMNONE" | cut -d: -f2|sed 's/ //g')"
vlnone="$(cat ~/log-install.txt | grep -w "VLNONE" | cut -d: -f2|sed 's/ //g')"
ovpnssl="$(cat ~/log-install.txt | grep -w "OpenVPN SSL" | cut -d: -f2|sed 's/ //g')"
sstp="$(cat ~/log-install.txt | grep -i SSTP | cut -d: -f2|sed 's/ //g')"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "   [1]  Change Multi Port $tls"
echo -e "   [2]  Change Port SSH WS $ws"
echo -e "   [3]  Change Port Vmess NTLS  $vmnone"
echo -e "   [4]  Change Port Vless NTLS  $vlnone"
echo -e "   [5]  Change Port OVPN SSL  $ovpnssl"
echo -e "   [x]  Exit"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e ""
read -p "     Select From Options [1-5 or x] :  " prot
echo -e ""
case $prot in
1)
echo -e "${red}Warn !${NC} memodifikasi port ini akan"
echo -e "mengubah seluruh services yang menggunakan multi port $tls"
echo ""
read -p "Input New Port : " stlxray
if [ -z $stlxray ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $stlxray)
if [[ -z $cek ]]; then
sed -i "s/$tls/$stlxray/g" /etc/default/sslh
sed -i "s/   - XRAY TLS                : $tls/   - XRAY TLS                : $stlxray/g" /root/log-install.txt
sed -i "s/   - Stunnel5                : $tls/   - Stunnel5                : $stlxray/g" /root/log-install.txt
chmod -R 755 /etc/ssl/private/
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $tls -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $tls -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $stlxray -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $stlxray -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart xray > /dev/null
systemctl restart will666 > /dev/null
systemctl restart will69 > /dev/null
/etc/init.d/stunnel5 restart > /dev/null
systemctl restart cdn > /dev/null
systemctl restart sslh > /dev/null
echo -e "\e[032;1mPort $stlxray modified successfully\e[0m"
else
echo "Port $stlxray is used"
fi
;;
2)
read -p "Input New Port : " ws1
if [ -z $ws1 ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $ws1)
if [[ -z $cek ]]; then
sed -i "s/$ws/$ws1/g" /etc/stunnel/stunnel.conf
sed -E -i 's/"dest":\s*\b'$ws'\b/"dest": '$ws1'/g' /usr/local/etc/xray/will69.json
sed -i "s#proxy_pass http://localhost:$ws;#proxy_pass http://localhost:$ws1;#" "/etc/nginx/conf.d/vmnone.conf"
sed -i "s/$ws/$ws1/g" /etc/systemd/system/cdn.service
sed -i "s/$ws/$ws1/g" /etc/william/PDirect.js
sed -i "s/   - SSHWS                   : $ws/   - SSHWS                   : $ws1/g" /root/log-install.txt
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $ws -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $ws -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $ws1 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $ws1 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl daemon-reload > /dev/null
systemctl restart cdn > /dev/null
systemctl restart will69 > /dev/null
systemctl restart nginx > /dev/null
echo -e "\e[032;1mPort $ws1 modified successfully\e[0m"
else
echo "Port $ws1 is used"
fi
;;
3)
read -p "Input New Port : " vmnone1
if [ -z $vmnone1 ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $vmnone1)
if [[ -z $cek ]]; then
sed -i "s/listen $vmnone backlog=65535 reuseport;/listen $vmnone1 backlog=65535 reuseport;/" "/etc/nginx/conf.d/vmnone.conf"
sed -i "s/   - VMNONE                  : $vmnone/   - VMNONE                  : $vmnone1/g" /root/log-install.txt
chmod -R 755 /etc/ssl/private/
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $vmnone -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $vmnone -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $vmnone1 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $vmnone1 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart nginx > /dev/null
systemctl restart xray@none > /dev/null
echo -e "\e[032;1mPort $vmnone1 modified successfully\e[0m"
else
echo "Port $vmnone1 is used"
fi
;;
4)
read -p "Input New Port : " vlnone1
if [ -z $vlnone1 ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $vlnone1)
if [[ -z $cek ]]; then
sed -i "s/$vlnone/$vlnone1/g" /etc/nginx/conf.d/vlnone.conf
sed -i "s/   - VLNONE                  : $vlnone/   - VLNONE                  : $vlnone1/g" /root/log-install.txt
chmod -R 755 /etc/ssl/private/
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $vlnone -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $vlnone -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $vlnone1 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $vlnone1 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl restart nginx > /dev/null
systemctl restart xray@none > /dev/null
echo -e "\e[032;1mPort $vlnone1 modified successfully\e[0m"
else
echo "Port $vlnone1 is used"
fi
;;
5)
read -p "Input New Port : " ovpnssl1
if [ -z $ovpnssl1 ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $ovpnssl1)
if [[ -z $cek ]]; then
sed -i "s/$ovpnssl/$ovpnssl1/g" /etc/stunnel/stunnel.conf
sed -i "s/   - OpenVPN SSL             : $ovpnssl/   - OpenVPN SSL             : $ovpnssl1/g" /root/log-install.txt
cat > /etc/openvpn/client-tcp-ssl-${ovpnssl1}.ovpn <<-END
client
dev tun
proto tcp
remote $MYIP $ovpnssl1
resolv-retry infinite
route-method exe
nobind
persist-key
persist-tun
auth-user-pass
comp-lzo
verb 3
END
echo '<ca>' >> /etc/openvpn/client-tcp-ssl-${ovpnssl1}.ovpn
cat /etc/openvpn/server/ca.crt >> /etc/openvpn/client-tcp-ssl-${ovpnssl1}.ovpn
echo '</ca>' >> /etc/openvpn/client-tcp-ssl-${ovpnssl1}.ovpn
cp /etc/openvpn/client-tcp-ssl-${ovpnssl1}.ovpn /home/vps/public_html/client-tcp-ssl-${ovpnssl1}.ovpn
iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $none -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $none -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $none1 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $none1 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
clear
/etc/init.d/openvpn restart > /dev/null
/etc/init.d/stunnel5 restart > /dev/null
rm -rf /home/vps/public_html/client-tcp-ssl-$ovpnssl.ovpn
rm -rf /etc/openvpn/client-tcp-ssl-$ovpnssl.ovpn
rm -rf /etc/openvpn/client-tcp-ssl-.ovpn
rm -rf /home/vps/public_html/client-tcp-ssl-.ovpn
echo -e "\e[032;1mPort $ovpnssl1 modified successfully\e[0m"
else
echo "Port $ovpnssl1 is used"
fi
;;
x)
exit
menu
;;
*)
echo "Please enter an correct number"
;;
esac

