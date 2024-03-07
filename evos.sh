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

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
KEY=$(cat /etc/william/profile/key 2>/dev/null)
CHATID=$(cat /etc/william/profile/chatid 2>/dev/null)
if [[ -z $KEY || -z $CHATID ]]; then
echo "Please Fill API BOT & CHAT ID First !!"
exit
fi
if ! grep -q -w "ban-xray" /etc/crontab; then
echo -e "*/20 * * * * root ban-xray" >> /etc/crontab
/etc/init.d/cron restart
fi
if ! grep -q -w "ban-ssh" /etc/crontab; then
echo -e "*/3 * * * * root ban-ssh" >> /etc/crontab
/etc/init.d/cron restart
fi
domain=$(cat /etc/xray/domain)
datac=$(cat /usr/local/etc/xray/config.json | grep '###' | cut -d ' ' -f 2 | sort | uniq > /tmp/datac)
data69=$(cat /usr/local/etc/xray/will69.json | grep '###' | cut -d ' ' -f 2 | sort | uniq >> /tmp/datac)
datac666=$(cat /usr/local/etc/xray/will666.json | grep '###' | cut -d ' ' -f 2 | sort | uniq >> /tmp/datac)
datac6969=$(cat /usr/local/etc/xray/none.json | grep '###' | cut -d ' ' -f 2 | sort | uniq >> /tmp/datac)
data=$(cat /tmp/datac | sort -u)
for useractive in $data; do
ip_limit_vmessws=$(cat /etc/william/limit-xray/vmessws/$useractive 2>/dev/null)
ip_limit_trojanws=$(cat /etc/william/limit-xray/trojanws/$useractive 2>/dev/null)
ip_limit_vlessws=$(cat /etc/william/limit-xray/vlessws/$useractive 2>/dev/null)
date_1minute=$(date -R -d "1 minute ago" | awk '{print $5}' | cut -d: -f 1-2)
if grep -q -w "${useractive}" /var/log/xray/access.log || grep -q -w "${useractive}" /var/log/xray/access2.log; then
ip_list=$(cat /var/log/xray/access.log | grep -w "$useractive" | awk '{print $2, $3, $5}' | grep -w "^${date_1minute}" | sed 's/:[^:]*$//' | awk '!seen[$2]++' | awk '!seen[$3]++' | awk '{sub(/:[^:]*$/, "", $2)}1' | sed '/1.1.1.1/d' | sed '/1.0.0.1/d' | sed '/8.8.8.8/d' | sed '/8.8.4.4/d' | sed '/bing.com/d' | sed '/one.one.one.one/d' | sed '/gstatic.com/d' | sed '/mtalk.google.com/d' | sed '#proxy/vmess/encoding:#d' | sed 's/tcp://' | awk -F' ' '!ip_seen[$2]++ {split($2, octets, "."); similar_ip = octets[1]"."octets[2]"."octets[3]".*"; if (similar_ip != prev_octet) { print; prev_octet = similar_ip }}' | sort -u | sed 's/ / » /g')
cek_mulog=$(echo -e "$ip_list" | wc -l);
if [ -n "$ip_list" ]; then
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
# -- BW -- #
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "━━━━━━━━[Monitoring User Xray TLS Login]━━━━━━━"
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "USERNAME : $useractive"
echo -e "${cyan}-------------------------------------------${NC}"
echo -e "$ip_list"
echo -e "${cyan}-------------------------------------------${NC}"
echo -e "$cek_mulog"
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
# MULOG VMESS WS
if [[ $cek_mulog -gt $ip_limit_vmessws && $ip_limit_vmessws -ne 0 ]]; then
ngecek_banned=$(cat /usr/local/etc/xray/config.json | grep -w "$useractive" | awk {'print $1'} | grep -w "#banned_vmessws" | wc -l)
if [[ "$ngecek_banned" = "1" ]]; then
echo -e "user already banned"
else
sed -i '/"email": "'"$useractive"'"/s/,/#banned_vmessws ,/' /usr/local/etc/xray/config.json
sed -i '/"email": "'"$useractive"'"/s/},/#banned_vmessws },/' /usr/local/etc/xray/none.json
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
TEXT="
<b>━━━━━━━━━━━━━━━━━━</b>
<b>MULTI LOGIN VMESS WS</b>
<b>━━━━━━━━━━━━━━━━━━</b>
<b>Username: </b><code>$useractive</code>
<b>Domain: </b><code>$domain</code>
<b>Limit IP: </b><code>$ip_limit_vmessws</code>
<b>Multi Login IP: </b><code>$cek_mulog</code>
<b>Quota Usage: </b><code>$size_in_gb_vmesswstls $size_unit_vmesswstls</code>
<b>Action: </b><code>BANNED</code>
<b>-----------------LOGS-----------------</b>
$ip_list
<b>-----------------------------------------</b>
<b>info : time on » ip » access</b>
<b>━━━━━━━━━━━━━━━━━━</b>
"
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
systemctl restart xray
systemctl restart xray@none
fi
fi
# MULOG TROJAN WS
if [[ $cek_mulog -gt $ip_limit_trojanws && $ip_limit_trojanws -ne 0 ]]; then
ngecek_banned=$(cat /usr/local/etc/xray/config.json | grep -w "$useractive" | awk {'print $1'} | grep -w "#banned_trojanws" | wc -l)
if [[ "$ngecek_banned" = "1" ]]; then
echo -e "user already banned"
else
sed -i '/"email": "'"$useractive"'"/s/,/#banned_trojanws ,/' /usr/local/etc/xray/config.json
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
TEXT="
<b>━━━━━━━━━━━━━━━━━━</b>
<b>MULTI LOGIN TROJAN WS</b>
<b>━━━━━━━━━━━━━━━━━━</b>
<b>Username: </b><code>$useractive</code>
<b>Domain: </b><code>$domain</code>
<b>Limit IP: </b><code>$ip_limit_trojanws</code>
<b>Multi Login IP: </b><code>$cek_mulog</code>
<b>Quota Usage: </b><code>$size_in_gb_total_trojanws $size_unit_total_trojanws</code>
<b>Action: </b><code>BANNED</code>
<b>-----------------LOGS-----------------</b>
$ip_list
<b>-----------------------------------------</b>
<b>info : time on » ip » access</b>
<b>━━━━━━━━━━━━━━━━━━</b>
"
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
systemctl restart xray
fi
fi
# MULOG VLESS WS
if [[ $cek_mulog -gt $ip_limit_vlessws && $ip_limit_vlessws -ne 0 ]]; then
ngecek_banned=$(cat /usr/local/etc/xray/config.json | grep -w "$useractive" | awk {'print $1'} | grep -w "#banned_vlessws" | wc -l)
if [[ "$ngecek_banned" = "1" ]]; then
echo -e "user already banned"
else
sed -i '/"email": "'"$useractive"'"/s/,/#banned_vlessws ,/' /usr/local/etc/xray/config.json
sed -i '/"email": "'"$useractive"'"/s/},/#banned_vlessws },/' /usr/local/etc/xray/none.json
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
TEXT="
<b>━━━━━━━━━━━━━━━━━━</b>
<b>MULTI LOGIN VLESS WS</b>
<b>━━━━━━━━━━━━━━━━━━</b>
<b>Username: </b><code>$useractive</code>
<b>Domain: </b><code>$domain</code>
<b>Limit IP: </b><code>$ip_limit_vlessws</code>
<b>Multi Login IP: </b><code>$cek_mulog</code>
<b>Quota Usage: </b><code>$size_in_gb_vlesswstls $size_unit_vlesswstls</code>
<b>Action: </b><code>BANNED</code>
<b>-----------------LOGS-----------------</b>
$ip_list
<b>-----------------------------------------</b>
<b>info : time on » ip » access</b>
<b>━━━━━━━━━━━━━━━━━━</b>
"
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
systemctl restart xray
systemctl restart xray@none
fi
fi
fi
#NTLS
ip_list2=$(cat /var/log/xray/access2.log | grep -w "$useractive" | awk '{print $2, $3, $5}' | grep -w "^${date_1minute}" | sed 's/:[^:]*$//' | awk '!seen[$2]++' | awk '!seen[$3]++' | awk '{sub(/:[^:]*$/, "", $2)}1' | sed '/1.1.1.1/d' | sed '/1.0.0.1/d' | sed '/8.8.8.8/d' | sed '/8.8.4.4/d' | sed '/bing.com/d' | sed '/one.one.one.one/d' | sed '/gstatic.com/d' | sed '/mtalk.google.com/d' | sed '#proxy/vmess/encoding:#d' | sed 's/tcp://' | awk -F' ' '!ip_seen[$2]++ {split($2, octets, "."); similar_ip = octets[1]"."octets[2]"."octets[3]".*"; if (similar_ip != prev_octet) { print; prev_octet = similar_ip }}' | sort -u | sed 's/ / » /g')
cek_mulog2=$(echo -e "$ip_list2" | wc -l)
if [ -n "$ip_list2" ]; then
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
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "━━━━━━━━[Monitoring User Xray NTLS Login]━━━━━━━"
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "USERNAME : $useractive"
echo -e "${cyan}-------------------------------------------${NC}"
echo -e "$ip_list2"
echo -e "${cyan}-------------------------------------------${NC}"
echo -e "$cek_mulog2"
echo -e "${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
# MULOG VMESS WS
if [[ $cek_mulog2 -gt $ip_limit_vmessws && $ip_limit_vmessws -ne 0 ]]; then
ngecek_banned=$(cat /usr/local/etc/xray/config.json | grep -w "$useractive" | awk {'print $1'} | grep -w "#banned_vmessws" | wc -l)
if [[ "$ngecek_banned" = "1" ]]; then
echo -e "user already banned"
else
sed -i '/"email": "'"$useractive"'"/s/,/#banned_vmessws ,/' /usr/local/etc/xray/config.json
sed -i '/"email": "'"$useractive"'"/s/},/#banned_vmessws },/' /usr/local/etc/xray/none.json
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
TEXT="
<b>━━━━━━━━━━━━━━━━━━</b>
<b>MULTI LOGIN VMESS WS</b>
<b>━━━━━━━━━━━━━━━━━━</b>
<b>Username: </b><code>$useractive</code>
<b>Domain: </b><code>$domain</code>
<b>Limit IP: </b><code>$ip_limit_vmessws</code>
<b>Multi Login IP: </b><code>$cek_mulog2</code>
<b>Quota Usage: </b><code>$size_in_gb_vmesswsntls $size_unit_vmesswsntls</code>
<b>Action: </b><code>BANNED</code>
<b>-----------------LOGS-----------------</b>
$ip_list2
<b>-----------------------------------------</b>
<b>info : time on » ip » access</b>
<b>━━━━━━━━━━━━━━━━━━</b>
"
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
systemctl restart xray
systemctl restart xray@none
fi
fi
# MULOG VLESS WS
if [[ $cek_mulog2 -gt $ip_limit_vlessws && $ip_limit_vlessws -ne 0 ]]; then
ngecek_banned=$(cat /usr/local/etc/xray/config.json | grep -w "$useractive" | awk {'print $1'} | grep -w "#banned_vlessws" | wc -l)
if [[ "$ngecek_banned" = "1" ]]; then
echo -e "user already banned"
else
sed -i '/"email": "'"$useractive"'"/s/,/#banned_vlessws ,/' /usr/local/etc/xray/config.json
sed -i '/"email": "'"$useractive"'"/s/},/#banned_vlessws },/' /usr/local/etc/xray/none.json
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
TEXT="
<b>━━━━━━━━━━━━━━━━━━</b>
<b>MULTI LOGIN VLESS WS</b>
<b>━━━━━━━━━━━━━━━━━━</b>
<b>Username: </b><code>$useractive</code>
<b>Domain: </b><code>$domain</code>
<b>Limit IP: </b><code>$ip_limit_vlessws</code>
<b>Multi Login IP: </b><code>$cek_mulog2</code>
<b>Quota Usage: </b><code>$size_in_gb_vlesswsntls $size_unit_vlesswsntls</code>
<b>Action: </b><code>BANNED</code>
<b>-----------------LOGS-----------------</b>
$ip_list2
<b>-----------------------------------------</b>
<b>info : time on » ip » access</b>
<b>━━━━━━━━━━━━━━━━━━</b>
"
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
systemctl restart xray
systemctl restart xray@none
fi
fi
fi
fi
done