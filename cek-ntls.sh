#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
kuning='\033[0;33m'
cyan='\033[0;36m'
biru='\e[0;34m'
oranye='\e[0;33m'
NC='\e[0m'

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

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
domain=$(cat /etc/xray/domain)
data_ntls=$(cat /usr/local/etc/xray/none.json | grep '###' | cut -d ' ' -f 2 | sort -u)
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "━━━━━━━━[Monitoring User Xray NTLS Login]━━━━━━━"
for useractive in $data_ntls; do
date_1minute=$(date -R -d "1 minute ago" | awk '{print $5}' | cut -d: -f 1-2)
if grep -q -w "${useractive}" /var/log/xray/access2.log; then
ip_list=$(cat /var/log/xray/access2.log | grep -w "$useractive" | awk '{print $2, $3, $5}' | grep -w "^${date_1minute}" | sed 's/:[^:]*$//' | awk '!seen[$2]++' | awk '!seen[$3]++' | awk '{sub(/:[^:]*$/, "", $2)}1' | sed '/1.1.1.1/d' | sed '/1.0.0.1/d' | sed '/8.8.8.8/d' | sed '/8.8.4.4/d' | sed '/bing.com/d' | sed '/one.one.one.one/d' | sed '/gstatic.com/d' | sed '/mtalk.google.com/d' | sed '#proxy/vmess/encoding:#d' | sed 's/tcp://' | awk -F' ' '!ip_seen[$2]++ {split($2, octets, "."); similar_ip = octets[1]"."octets[2]"."octets[3]".*"; if (similar_ip != prev_octet) { print; prev_octet = similar_ip }}' | sort -u | sed 's/ / » /g')
ip_login=$(echo -e "$ip_list" | wc -l)
if [ -n "$ip_list" ]; then
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "Username : $useractive"
# -- BW -- #
# VMESS WS NTLS
if [[ -e /etc/usage/vmesswsntls-uplink/${useractive} ]]; then
byt1_vmesswsntls=$(cat /etc/usage/vmesswsntls-downlink/${useractive})
byt2_vmesswsntls=$(cat /etc/usage/vmesswsntls-uplink/${useractive})
num1_vmesswsntls=$((byt1_vmesswsntls))
num2_vmesswsntls=$((byt2_vmesswsntls))
sum_vmesswsntls=$((num1_vmesswsntls + num2_vmesswsntls))
if (( sum_vmesswsntls >= 1024*1024*1024*1024 )); then
size_in_gb_vmesswsntls=$(echo "scale=2; $sum_vmesswsntls/1024/1024/1024/1024" | bc)
size_unit_vmesswsntls="TB"
elif (( sum_vmesswsntls >= 1024*1024*1024 )); then
size_in_gb_vmesswsntls=$(echo "scale=2; $sum_vmesswsntls/1024/1024/1024" | bc)
size_unit_vmesswsntls="GB"
elif (( sum_vmesswsntls >= 1024*1024 )); then
size_in_gb_vmesswsntls=$(echo "scale=2; $sum_vmesswsntls/1024/1024" | bc)
size_unit_vmesswsntls="MB"
else
size_in_gb_vmesswsntls=$(echo "scale=2; $sum_vmesswsntls/1024" | bc)
size_unit_vmesswsntls="KB"
fi
else
size_in_gb_vmesswsntls=""
size_unit_vmesswsntls=""
fi
# VLESS WS NTLS
if [[ -e /etc/usage/vlesswsntls-uplink/${useractive} ]]; then
byt1_vlesswsntls=$(cat /etc/usage/vlesswsntls-downlink/${useractive})
byt2_vlesswsntls=$(cat /etc/usage/vlesswsntls-uplink/${useractive})
num1_vlesswsntls=$((byt1_vlesswsntls))
num2_vlesswsntls=$((byt2_vlesswsntls))
sum_vlesswsntls=$((num1_vlesswsntls + num2_vlesswsntls))
if (( sum_vlesswsntls >= 1024*1024*1024*1024 )); then
size_in_gb_vlesswsntls=$(echo "scale=2; $sum_vlesswsntls/1024/1024/1024/1024" | bc)
size_unit_vlesswsntls="TB"
elif (( sum_vlesswsntls >= 1024*1024*1024 )); then
size_in_gb_vlesswsntls=$(echo "scale=2; $sum_vlesswsntls/1024/1024/1024" | bc)
size_unit_vlesswsntls="GB"
elif (( sum_vlesswsntls >= 1024*1024 )); then
size_in_gb_vlesswsntls=$(echo "scale=2; $sum_vlesswsntls/1024/1024" | bc)
size_unit_vlesswsntls="MB"
else
size_in_gb_vlesswsntls=$(echo "scale=2; $sum_vlesswsntls/1024" | bc)
size_unit_vlesswsntls="KB"
fi
else
size_in_gb_vlesswsntls=""
size_unit_vlesswsntls=""
fi
# -- BW -- #
# -- OUTPUT BW -- #
if [[ -s /etc/usage/vmesswsntls-uplink/${useractive} ]]; then
    echo -e "Protocol : VMESS WS NTLS"
    echo -e "Quota Usage : ${green}$size_in_gb_vmesswsntls $size_unit_vmesswsntls${NC} [TOTAL ${biru}IN${NC} & ${oranye}OUT${NC}]"
elif [[ -s /etc/usage/vlesswsntls-uplink/${useractive} ]]; then
    echo -e "Protocol : VLESS WS NTLS"
    echo -e "Quota Usage : ${green}$size_in_gb_vlesswsntls $size_unit_vlesswsntls${NC} [TOTAL ${biru}IN${NC} & ${oranye}OUT${NC}]"
else
    echo -e "Quota Usage : ${green}${useractive}${NC} ${red}Tidak Terdeteksi${NC}"
fi
# -- OUTPUT BW -- #
echo -e "${cyan}-------------------------------------------${NC}"
echo -e "Time     » IP Client   » Client Access"
echo -e "${cyan}-------------------------------------------${NC}"
echo -e "$ip_list"
echo -e "${cyan}-------------------------------------------${NC}"
echo -e "IP Client : $ip_login"
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
fi
fi
done