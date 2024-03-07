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
datac=$(cat /usr/local/etc/xray/config.json | grep '###' | cut -d ' ' -f 2 | sort | uniq > /tmp/datac)
data69=$(cat /usr/local/etc/xray/will69.json | grep '###' | cut -d ' ' -f 2 | sort | uniq >> /tmp/datac)
datac666=$(cat /usr/local/etc/xray/will666.json | grep '###' | cut -d ' ' -f 2 | sort | uniq >> /tmp/datac)
data_tls=$(cat /tmp/datac | sort -u)
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "━━━━━━━━[Monitoring User Xray TLS Login]━━━━━━━"
for useractive in $data_tls; do
date_1minute=$(date -R -d "1 minute ago" | awk '{print $5}' | cut -d: -f 1-2)
if grep -q -w "${useractive}" /var/log/xray/access.log; then
ip_list=$(cat /var/log/xray/access.log | grep -w "$useractive" | awk '{print $2, $3, $5}' | grep -w "^${date_1minute}" | sed 's/:[^:]*$//' | awk '!seen[$2]++' | awk '!seen[$3]++' | awk '{sub(/:[^:]*$/, "", $2)}1' | sed '/1.1.1.1/d' | sed '/1.0.0.1/d' | sed '/8.8.8.8/d' | sed '/8.8.4.4/d' | sed '/bing.com/d' | sed '/one.one.one.one/d' | sed '/gstatic.com/d' | sed '/mtalk.google.com/d' | sed '#proxy/vmess/encoding:#d' | sed 's/tcp://' | awk -F' ' '!ip_seen[$2]++ {split($2, octets, "."); similar_ip = octets[1]"."octets[2]"."octets[3]".*"; if (similar_ip != prev_octet) { print; prev_octet = similar_ip }}' | sort -u | sed 's/ / » /g')
ip_login=$(echo -e "$ip_list" | wc -l)
if [ -n "$ip_list" ]; then
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "Username : $useractive"
# -- BW -- #
# TROJAN WS TLS
if [[ -e /etc/usage/trojanws-uplink/${useractive} ]]; then
byt1_trojanws=$(cat /etc/usage/trojanws-downlink/${useractive})
byt2_trojanws=$(cat /etc/usage/trojanws-uplink/${useractive})
sum_trojanws=$((byt1_trojanws + byt2_trojanws))
if (( sum_trojanws >= 1024*1024*1024*1024 )); then
size_in_gb_total_trojanws=$(echo "scale=2; $sum_trojanws/1024/1024/1024/1024" | bc)
size_unit_total_trojanws="TB"
elif (( sum_trojanws >= 1024*1024*1024 )); then
size_in_gb_total_trojanws=$(echo "scale=2; $sum_trojanws/1024/1024/1024" | bc)
size_unit_total_trojanws="GB"
elif (( sum_trojanws >= 1024*1024 )); then
size_in_gb_total_trojanws=$(echo "scale=2; $sum_trojanws/1024/1024" | bc)
size_unit_total_trojanws="MB"
else
size_in_gb_total_trojanws=$(echo "scale=2; $sum_trojanws/1024" | bc)
size_unit_total_trojanws="KB"
fi
else
size_in_gb_total_trojanws=""
size_unit_total_trojanws=""
fi
# TROJAN TCP TLS
if [[ -e /etc/usage/trojan-uplink/${useractive} ]]; then
byt1_trojan=$(cat /etc/usage/trojan-downlink/${useractive})
byt2_trojan=$(cat /etc/usage/trojan-uplink/${useractive})
sum_trojan=$((byt1_trojan + byt2_trojan))
if (( sum_trojan >= 1024*1024*1024*1024 )); then
size_in_gb_total_trojan=$(echo "scale=2; $sum_trojan/1024/1024/1024/1024" | bc)
size_unit_total_trojan="TB"
elif (( sum_trojan >= 1024*1024*1024 )); then
size_in_gb_total_trojan=$(echo "scale=2; $sum_trojan/1024/1024/1024" | bc)
size_unit_total_trojan="GB"
elif (( sum_trojan >= 1024*1024 )); then
size_in_gb_total_trojan=$(echo "scale=2; $sum_trojan/1024/1024" | bc)
size_unit_total_trojan="MB"
else
size_in_gb_total_trojan=$(echo "scale=2; $sum_trojan/1024" | bc)
size_unit_total_trojan="KB"
fi
else
size_in_gb_total_trojan=""
size_unit_total_trojan=""
fi
# VMESS WS TLS
if [[ -e /etc/usage/vmesswstls-uplink/${useractive} ]]; then
byt1_vmesswstls=$(cat /etc/usage/vmesswstls-downlink/${useractive})
byt2_vmesswstls=$(cat /etc/usage/vmesswstls-uplink/${useractive})
num1_vmesswstls=$((byt1_vmesswstls))
num2_vmesswstls=$((byt2_vmesswstls))
sum_vmesswstls=$((num1_vmesswstls + num2_vmesswstls))
if (( sum_vmesswstls >= 1024*1024*1024*1024 )); then
size_in_gb_vmesswstls=$(echo "scale=2; $sum_vmesswstls/1024/1024/1024/1024" | bc)
size_unit_vmesswstls="TB"
elif (( sum_vmesswstls >= 1024*1024*1024 )); then
size_in_gb_vmesswstls=$(echo "scale=2; $sum_vmesswstls/1024/1024/1024" | bc)
size_unit_vmesswstls="GB"
elif (( sum_vmesswstls >= 1024*1024 )); then
size_in_gb_vmesswstls=$(echo "scale=2; $sum_vmesswstls/1024/1024" | bc)
size_unit_vmesswstls="MB"
else
size_in_gb_vmesswstls=$(echo "scale=2; $sum_vmesswstls/1024" | bc)
size_unit_vmesswstls="KB"
fi
else
size_in_gb_vmesswstls=""
size_unit_vmesswstls=""
fi
# VLESS WS TLS
if [[ -e /etc/usage/vlesswstls-uplink/${useractive} ]]; then
byt1_vlesswstls=$(cat /etc/usage/vlesswstls-downlink/${useractive})
byt2_vlesswstls=$(cat /etc/usage/vlesswstls-uplink/${useractive})
num1_vlesswstls=$((byt1_vlesswstls))
num2_vlesswstls=$((byt2_vlesswstls))
sum_vlesswstls=$((num1_vlesswstls + num2_vlesswstls))
if (( sum_vlesswstls >= 1024*1024*1024*1024 )); then
size_in_gb_vlesswstls=$(echo "scale=2; $sum_vlesswstls/1024/1024/1024/1024" | bc)
size_unit_vlesswstls="TB"
elif (( sum_vlesswstls >= 1024*1024*1024 )); then
size_in_gb_vlesswstls=$(echo "scale=2; $sum_vlesswstls/1024/1024/1024" | bc)
size_unit_vlesswstls="GB"
elif (( sum_vlesswstls >= 1024*1024 )); then
size_in_gb_vlesswstls=$(echo "scale=2; $sum_vlesswstls/1024/1024" | bc)
size_unit_vlesswstls="MB"
else
size_in_gb_vlesswstls=$(echo "scale=2; $sum_vlesswstls/1024" | bc)
size_unit_vlesswstls="KB"
fi
else
size_in_gb_vlesswstls=""
size_unit_vlesswstls=""
fi
# VLESS GRPC TLS
if [[ -e /etc/usage/vlessgrpctls-uplink/${useractive} ]]; then
byt1_vlessgrpctls=$(cat /etc/usage/vlessgrpctls-downlink/${useractive})
byt2_vlessgrpctls=$(cat /etc/usage/vlessgrpctls-uplink/${useractive})
num1_vlessgrpctls=$((byt1_vlessgrpctls))
num2_vlessgrpctls=$((byt2_vlessgrpctls))
sum_vlessgrpctls=$((num1_vlessgrpctls + num2_vlessgrpctls))
if (( sum_vlessgrpctls >= 1024*1024*1024*1024 )); then
size_in_gb_vlessgrpctls=$(echo "scale=2; $sum_vlessgrpctls/1024/1024/1024/1024" | bc)
size_unit_vlessgrpctls="TB"
elif (( sum_vlessgrpctls >= 1024*1024*1024 )); then
size_in_gb_vlessgrpctls=$(echo "scale=2; $sum_vlessgrpctls/1024/1024/1024" | bc)
size_unit_vlessgrpctls="GB"
elif (( sum_vlessgrpctls >= 1024*1024 )); then
size_in_gb_vlessgrpctls=$(echo "scale=2; $sum_vlessgrpctls/1024/1024" | bc)
size_unit_vlessgrpctls="MB"
else
size_in_gb_vlessgrpctls=$(echo "scale=2; $sum_vlessgrpctls/1024" | bc)
size_unit_vlessgrpctls="KB"
fi
else
size_in_gb_vlessgrpctls=""
size_unit_vlessgrpctls=""
fi
# VLESS XTLS
if [[ -e /etc/usage/vlessxtls-uplink/${useractive} ]]; then
byt1_vlessxtls=$(cat /etc/usage/vlessxtls-downlink/${useractive})
byt2_vlessxtls=$(cat /etc/usage/vlessxtls-uplink/${useractive})
num1_vlessxtls=$((byt1_vlessxtls))
num2_vlessxtls=$((byt2_vlessxtls))
sum_vlessxtls=$((num1_vlessxtls + num2_vlessxtls))
if (( sum_vlessxtls >= 1024*1024*1024*1024 )); then
size_in_gb_vlessxtls=$(echo "scale=2; $sum_vlessxtls/1024/1024/1024/1024" | bc)
size_unit_vlessxtls="TB"
elif (( sum_vlessxtls >= 1024*1024*1024 )); then
size_in_gb_vlessxtls=$(echo "scale=2; $sum_vlessxtls/1024/1024/1024" | bc)
size_unit_vlessxtls="GB"
elif (( sum_vlessxtls >= 1024*1024 )); then
size_in_gb_vlessxtls=$(echo "scale=2; $sum_vlessxtls/1024/1024" | bc)
size_unit_vlessxtls="MB"
else
size_in_gb_vlessxtls=$(echo "scale=2; $sum_vlessxtls/1024" | bc)
size_unit_vlessxtls="KB"
fi
else
size_in_gb_vlessxtls=""
size_unit_vlessxtls=""
fi
# VMESS GRPC
if [[ -e /etc/usage/vmessgrpctls-uplink/${useractive} ]]; then
byt1_vmessgrpctls=$(cat /etc/usage/vmessgrpctls-downlink/${useractive})
byt2_vmessgrpctls=$(cat /etc/usage/vmessgrpctls-uplink/${useractive})
num1_vmessgrpctls=$((byt1_vmessgrpctls))
num2_vmessgrpctls=$((byt2_vmessgrpctls))
sum_vmessgrpctls=$((num1_vmessgrpctls + num2_vmessgrpctls))
if (( sum_vmessgrpctls >= 1024*1024*1024*1024 )); then
size_in_gb_vmessgrpctls=$(echo "scale=2; $sum_vmessgrpctls/1024/1024/1024/1024" | bc)
size_unit_vmessgrpctls="TB"
elif (( sum_vmessgrpctls >= 1024*1024*1024 )); then
size_in_gb_vmessgrpctls=$(echo "scale=2; $sum_vmessgrpctls/1024/1024/1024" | bc)
size_unit_vmessgrpctls="GB"
elif (( sum_vmessgrpctls >= 1024*1024 )); then
size_in_gb_vmessgrpctls=$(echo "scale=2; $sum_vmessgrpctls/1024/1024" | bc)
size_unit_vmessgrpctls="MB"
else
size_in_gb_vmessgrpctls=$(echo "scale=2; $sum_vmessgrpctls/1024" | bc)
size_unit_vmessgrpctls="KB"
fi
else
size_in_gb_vmessgrpctls=""
size_unit_vmessgrpctls=""
fi
# VMESS TCP HTTP
if [[ -e /etc/usage/vmesstcphttp-uplink/${useractive} ]]; then
byt1_vmesstcphttp=$(cat /etc/usage/vmesstcphttp-downlink/${useractive})
byt2_vmesstcphttp=$(cat /etc/usage/vmesstcphttp-uplink/${useractive})
num1_vmesstcphttp=$((byt1_vmesstcphttp))
num2_vmesstcphttp=$((byt2_vmesstcphttp))
sum_vmesstcphttp=$((num1_vmesstcphttp + num2_vmesstcphttp))
if (( sum_vmesstcphttp >= 1024*1024*1024*1024 )); then
size_in_gb_vmesstcphttp=$(echo "scale=2; $sum_vmesstcphttp/1024/1024/1024/1024" | bc)
size_unit_vmesstcphttp="TB"
elif (( sum_vmesstcphttp >= 1024*1024*1024 )); then
size_in_gb_vmesstcphttp=$(echo "scale=2; $sum_vmesstcphttp/1024/1024/1024" | bc)
size_unit_vmesstcphttp="GB"
elif (( sum_vmesstcphttp >= 1024*1024 )); then
size_in_gb_vmesstcphttp=$(echo "scale=2; $sum_vmesstcphttp/1024/1024" | bc)
size_unit_vmesstcphttp="MB"
else
size_in_gb_vmesstcphttp=$(echo "scale=2; $sum_vmesstcphttp/1024" | bc)
size_unit_vmesstcphttp="KB"
fi
else
size_in_gb_vmesstcphttp=""
size_unit_vmesstcphttp=""
fi
# TROJAN GRPC
if [[ -e /etc/usage/trojangrpctls-uplink/${useractive} ]]; then
byt1_trojangrpctls=$(cat /etc/usage/trojangrpctls-downlink/${useractive})
byt2_trojangrpctls=$(cat /etc/usage/trojangrpctls-uplink/${useractive})
num1_trojangrpctls=$((byt1_trojangrpctls))
num2_trojangrpctls=$((byt2_trojangrpctls))
sum_trojangrpctls=$((num1_trojangrpctls + num2_trojangrpctls))
if (( sum_trojangrpctls >= 1024*1024*1024*1024 )); then
size_in_gb_trojangrpctls=$(echo "scale=2; $sum_trojangrpctls/1024/1024/1024/1024" | bc)
size_unit_trojangrpctls="TB"
elif (( sum_trojangrpctls >= 1024*1024*1024 )); then
size_in_gb_trojangrpctls=$(echo "scale=2; $sum_trojangrpctls/1024/1024/1024" | bc)
size_unit_trojangrpctls="GB"
elif (( sum_trojangrpctls >= 1024*1024 )); then
size_in_gb_trojangrpctls=$(echo "scale=2; $sum_trojangrpctls/1024/1024" | bc)
size_unit_trojangrpctls="MB"
else
size_in_gb_trojangrpctls=$(echo "scale=2; $sum_trojangrpctls/1024" | bc)
size_unit_trojangrpctls="KB"
fi
else
size_in_gb_trojangrpctls=""
size_unit_trojangrpctls=""
fi
# -- BW -- #
# -- OUTPUT BW -- #
if [[ -s /etc/usage/trojanws-uplink/${useractive} ]]; then
    echo -e "Protocol : TROJAN WS TLS"
    echo -e "Quota Usage : ${green}$size_in_gb_total_trojanws $size_unit_total_trojanws${NC} [TOTAL ${biru}IN${NC} & ${oranye}OUT${NC}]"
elif [[ -s /etc/usage/trojan-uplink/${useractive} ]]; then
    echo -e "Protocol : TROJAN TCP TLS"
    echo -e "Quota Usage : ${green}$size_in_gb_total_trojan $size_unit_total_trojan${NC} [TOTAL ${biru}IN${NC} & ${oranye}OUT${NC}]"
elif [[ -s /etc/usage/trojangrpctls-uplink/${useractive} ]]; then
    echo -e "Protocol : TROJAN GRPC TLS"
    echo -e "Quota Usage : ${green}$size_in_gb_trojangrpctls $size_unit_trojangrpctls${NC} [TOTAL ${biru}IN${NC} & ${oranye}OUT${NC}]"
elif [[ -s /etc/usage/vmesswstls-uplink/${useractive} ]]; then
    echo -e "Protocol : VMESS WS TLS"
    echo -e "Quota Usage : ${green}$size_in_gb_vmesswstls $size_unit_vmesswstls${NC} [TOTAL ${biru}IN${NC} & ${oranye}OUT${NC}]"
elif [[ -s /etc/usage/vmessgrpctls-uplink/${useractive} ]]; then
    echo -e "Protocol : VMESS GRPC TLS"
    echo -e "Quota Usage : ${green}$size_in_gb_vmessgrpctls $size_unit_vmessgrpctls${NC} [TOTAL ${biru}IN${NC} & ${oranye}OUT${NC}]"
elif [[ -s /etc/usage/vmesstcphttp-uplink/${useractive} ]]; then
    echo -e "Protocol : VMESS WS HTTP"
    echo -e "Quota Usage : ${green}$size_in_gb_vmesstcphttp $size_unit_vmesstcphttp${NC} [TOTAL ${biru}IN${NC} & ${oranye}OUT${NC}]"
elif [[ -s /etc/usage/vlesswstls-uplink/${useractive} ]]; then
    echo -e "Protocol : VLESS WS TLS"
    echo -e "Quota Usage : ${green}$size_in_gb_vlesswstls $size_unit_vlesswstls${NC} [TOTAL ${biru}IN${NC} & ${oranye}OUT${NC}]"
elif [[ -s /etc/usage/vlessgrpctls-uplink/${useractive} ]]; then
    echo -e "Protocol : VLESS GRPC TLS"
    echo -e "Quota Usage : ${green}$size_in_gb_vlessgrpctls $size_unit_vlessgrpctls${NC} [TOTAL ${biru}IN${NC} & ${oranye}OUT${NC}]"
elif [[ -s /etc/usage/vlessxtls-uplink/${useractive} ]]; then
    echo -e "Protocol : VLESS TCP XTLS"
    echo -e "Quota Usage : ${green}$size_in_gb_vlessxtls $size_unit_vlessxtls${NC} [TOTAL ${biru}IN${NC} & ${oranye}OUT${NC}]"
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