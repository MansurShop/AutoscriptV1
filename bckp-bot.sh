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

rm -rf /home/vps/public_html/restore/
ips=$(curl -sS ipinfo.io/ip);
domain=$( cat /etc/v2ray/domain )
chatid=$(cat /home/chatid)
apibot=$(cat /home/apibot)
date=$(date +"%Y-%m-%d" | cut -d "-" -f 2-3);
date2=$(date +"%Y-%m-%d");
time=$(date +"%H:%M:%S" | cut -d ":" -f 1-2);
rm -f $ips-$date-$time.zip
rm -rf /root/backup
mkdir /root/backup
cd /root
cp /root/log-install.txt /root/backup/
cp /etc/passwd /root/backup
cp /etc/group /root/backup
cp /etc/shadow /root/backup
cp /etc/gshadow /root/backup
cp /etc/ppp/chap-secrets backup/chap-secrets
cp /etc/ipsec.secrets backup/ipsec.secrets
cp /etc/ipsec.d/passwd backup/passwd1
cp /usr/local/etc/xray/config.json backup/
cp /usr/local/etc/xray/none.json backup/
cp /usr/local/etc/xray/will69.json backup/
cp /usr/local/etc/xray/will666.json backup/
cp /etc/systemd/system/cdn.service backup/
cp /etc/issue.net backup/
cp -r /etc/william/ backup/william
cp -r /etc/william/slowdns backup/slowdns
cp -r /etc/ssl/private/ backup/private
cp -r /var/lib/premium-script/ backup/premium-script
cp -r /home/vps/public_html backup/public_html
cp -r /etc/xray/ backup/xray/
cp -r /etc/v2ray/ backup/v2ray/
cp -r /etc/nginx/conf.d/ backup/conf.d/
rm -rf /root/backup/public_html/data-script/*
cd /root
zip -r $ips-backup-data.zip backup > /dev/null 2>&1
curl -F chat_id="$chatid" -F document=@"$ips-backup-data.zip" -F caption="
Thank You For Using Our Service
━━━━━━━━━━━━━━━━━━━
Tanggal Backup : $date2
━━━━━━━━━━━━━━━━━━━
Your Domain : $domain
Your IP VPS  : $ips
━━━━━━━━━━━━━━━━━━━
Cara Restore ?
1. Forward File Ini Ke Bot Direct Link/Mirror Link @direct_link69_bot
2. Copy hasil link ke menu restore di script

Note: Mohon Dibaca
- Jangan Lupa Mengaktifkan Auto backup Bot Telegram Agar Data Selalu TerUpdate
- Gunakan Juga Backup Via Gmail Jika VPS Tidak Memblockir Port SMTP
- Password VPS Akan Mengikuti Dari Data Yang Di Restore
━━━━━━━━━━━━━━━━━━━" https://api.telegram.org/bot$apibot/sendDocument
rm -rf $ips-backup-data.zip
clear
echo "done, please cek your group telegram"
rm -rf /root/backup