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
pathku=$(cat /etc/xray/path/vmess_ws_path)
ngecek=$(cat /etc/systemd/system/slowdns.service | grep -o "443")
nsdomain=$(cat /etc/ns/domain);
pubkey=$(cat /etc/william/slowdns/server.pub);
tls="$(cat ~/log-install.txt | grep -w "TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "VMNONE" | cut -d: -f2|sed 's/ //g')"
alternatifportntls=$(cat /etc/nginx/conf.d/vmnone.conf | grep listen | sed -n '2,$p' | awk '{printf $2 ", "; if(NR==FNR) printf ""}' | sed '$s/, $/./')
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "User: " -e user
		CLIENT_EXISTS=$(grep -w $user /usr/local/etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
cekvalidasi=$(cat /usr/local/etc/xray/config.json | grep -i "$user" | awk {'print $2'} | head -1 | wc -l)
if [ "$cekvalidasi" == "1" ]; then
echo ""
echo "user $user already exist"
echo "please choose another name"
exit 1
fi
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
KEY=$(cat /etc/william/profile/key 2>/dev/null)
CHATID=$(cat /etc/william/profile/key 2>/dev/null)
if [[ -n $KEY || -n $CHATID ]]; then
read -p "Limit IP Login (enter or type 0 for no limit): " limit_ip
if [[ -z "$limit_ip" || "$limit_ip" == "0" ]]; then
  limit_ip="0"
fi
echo "$limit_ip" > "/etc/william/limit-xray/vmessws/$user"
fi
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmessws$/a\### '"$user $exp VmessWS-TLS "'\
,{"id": "'""$uuid""'","level": '"0"',"email": "'""$user""'"}' /usr/local/etc/xray/config.json
sed -i '/#vmessWS$/a\### '"$user $exp VmessWS-NTLS "'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /usr/local/etc/xray/none.json
cat>/etc/xray/vmess/$user-tls.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "${tls}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "${pathku}",
      "type": "none",
      "host": "${domain}",
      "tls": "tls"
}
EOF
cat>/etc/xray/vmess/$user-none.json<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "${domain}",
      "port": "${none}",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "${pathku}",
      "type": "none",
      "host": "${domain}",
      "tls": "none"
}
EOF
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmesslink1="vmess://$(base64 -w 0 /etc/xray/vmess/$user-tls.json)"
vmesslink2="vmess://$(base64 -w 0 /etc/xray/vmess/$user-none.json)"
service cron restart
clear
echo -e ""
{
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "━━━[XRAY/VMESS_WS]━━━"
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "Remarks : ${user}"
ceklimit_ip=$(cat /etc/william/limit-xray/vmessws/$user 2>/dev/null)
if [[ -z $ceklimit_ip ]]; then
echo -e "Limit IP : Not Active"
else
if [ "$ceklimit_ip" == "0" ]; then
echo -e "Limit IP : No Limit IP Login"
else
echo -e "Limit IP : $limit_ip"
fi
fi
echo -e "IP Address : ${MYIP}"
echo -e "Domain : ${domain}"
if [[ "$ngecek" = "443" ]]; then
echo -e "DNS Domain : $nsdomain"
echo -e "Pub key slowdns : $pubkey"
fi
echo -e "Port TLS : ${tls}"
echo -e "Port NONE-TLS : ${none}"
echo -e "Port Alternatif NONE-TLS : $alternatifportntls"
echo -e "ID : ${uuid}"
echo -e "Network : Websocket"
echo -e "Websocket Path : ${pathku}"
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "LINK WS TLS : ${vmesslink1}"
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "LINK WS NONE-TLS : ${vmesslink2}"
echo -e "━━━━━━━━━━━━━━━━━━━━"
echo -e "EXPIRED ON : $exp"
} 2>&1 | tee -a /tmp/created-vmess.log
sed -i 's/Pub key slowdns : \(.*\)/Pub key slowdns : <code>\1<\/code>/g' /tmp/created-vmess.log
sed -i 's/ID : \(.*\)/ID : <code>\1<\/code>/g' /tmp/created-vmess.log
sed -i 's/LINK WS TLS : \(.*\)/LINK WS TLS : <code>\1<\/code>/g' /tmp/created-vmess.log
sed -i 's/LINK WS NONE-TLS : \(.*\)/LINK WS NONE-TLS : <code>\1<\/code>/g' /tmp/created-vmess.log
KEY=$(cat /etc/william/profile/private/key 2>/dev/null)
CHATID=$(cat /etc/william/profile/private/chatid 2>/dev/null)
message=$(cat /tmp/created-vmess.log)
curl -s -X POST https://api.telegram.org/bot${KEY}/sendMessage -F chat_id="${CHATID}" -F text="
$message" -F parse_mode=html > /dev/null 2>&1
rm -rf /tmp/created-vmess.log
systemctl restart xray
systemctl restart xray@none