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

if ! which vnstat > /dev/null; then
clear
echo -e "${red}Abuse Script Detected !${NC}"
sleep 2
exit 0
clear
fi

cekvnstat=$(systemctl status vnstat | grep -o "active (running)")
if [[ "$cekvnstat" = "active (running)" ]]; then
echo -e "${green}OK${NC}"
clear
else
echo -e "${red}Abuse Script Detected !${NC}"
exit
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

tokens=("06f54274ad91b8" "37a7dbff879d08" "5f81cab82564f8" "0ab90e27edf963")
index=$((RANDOM % ${#tokens[@]}))
token="${tokens[$index]}"
SCVERSION=$(cat /home/ver)
ISP=$(curl -sL ipinfo.io?token=${token} | jq .org | cut -d " " -f 2-15 | tr -d "\"" | tr -d ",")
CITY=$(curl -sL ipinfo.io?token=${token} | jq .city | tr -d "\"" | tr -d ",")
WKT=$(curl -sL ipinfo.io?token=${token} | jq .timezone | tr -d "\"" | tr -d ",")
REGION=$(curl -sL ipinfo.io?token=${token} | jq .region | tr -d "\"" | tr -d ",")
IPVPS=$(curl -sS ipinfo.io/ip )
if [ -z "$IPVPS" ]; then
IPVPS=$(curl -sS http://ip-api.com/ | grep -w "query" | awk {'print $3'} | tr -d '"')
fi
DOMAIN=$(cat /etc/xray/domain)
nsdomain=$(cat /etc/ns/domain)
target_epoch=$(date -d "$exp" +%s)
current_epoch=$(date +%s)
diff_epoch=$((target_epoch - current_epoch + 86400))
diff_days=$((diff_epoch / 86400))
calc_size() {
    local raw=$1
    local total_size=0
    local num=1
    local unit="KB"
    if ! [[ ${raw} =~ ^[0-9]+$ ]] ; then
        echo ""
        return
    fi
    if [ "${raw}" -ge 1073741824 ]; then
        num=1073741824
        unit="TB"
    elif [ "${raw}" -ge 1048576 ]; then
        num=1048576
        unit="GB"
    elif [ "${raw}" -ge 1024 ]; then
        num=1024
        unit="MB"
    elif [ "${raw}" -eq 0 ]; then
        echo "${total_size}"
        return
    fi
    total_size=$( awk 'BEGIN{printf "%.1f", '$raw' / '$num'}' )
    echo "${total_size} ${unit}"
}
_exists() {
    local cmd="$1"
    if eval type type > /dev/null 2>&1; then
        eval type "$cmd" > /dev/null 2>&1
    elif command > /dev/null 2>&1; then
        command -v "$cmd" > /dev/null 2>&1
    else
        which "$cmd" > /dev/null 2>&1
    fi
    local rt=$?
    return ${rt}
}
    arch=$( uname -m )
    if _exists "getconf"; then
        lbit=$( getconf LONG_BIT )
    else
        echo ${arch} | grep -q "64" && lbit="64" || lbit="32"
    fi
	cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
    disk_total_size=$( LANG=C; df -t simfs -t ext2 -t ext3 -t ext4 -t btrfs -t xfs -t vfat -t ntfs -t swap --total 2>/dev/null | grep total | awk '{ print $2 }' )
    disk_total_size=$( calc_size $disk_total_size )
    disk_used_size=$( LANG=C; df -t simfs -t ext2 -t ext3 -t ext4 -t btrfs -t xfs -t vfat -t ntfs -t swap --total 2>/dev/null | grep total | awk '{ print $3 }' )
    disk_used_size=$( calc_size $disk_used_size )
    tram=$( LANG=C; free | awk '/Mem/ {print $2}' )
    tram=$( calc_size $tram )
    uram=$( LANG=C; free | awk '/Mem/ {print $3}' )
    uram=$( calc_size $uram )
    swap=$( LANG=C; free | awk '/Swap/ {print $2}' )
    swap=$( calc_size $swap )
    uswap=$( LANG=C; free | awk '/Swap/ {print $3}' )
    uswap=$( calc_size $uswap )
	up=$(awk '{a=$1/86400;b=($1%86400)/3600;c=($1%3600)/60} {printf("%d days, %d hour %d min\n",a,b,c)}' /proc/uptime)
	kernel=$(uname -ar | cut -d " " -f 3-3)
	xrayversion=$(xray -version | awk '{print $2}' | head -1)
source /etc/os-release
clear
figlet -f small -t "      MANSURVPN" | lolcat
echo -e "              TELEGRAM : t.me/mansurrshop"
echo -e "              FECABOOK : Saya Tak Guna Facebook"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "\E[41;1;37m                 ⇱ SYSTEM INFORMATION ⇲                 \E[0m"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e " \e[032;1mOS SYSTEM:\e[0m $PRETTY_NAME"
echo -e " \e[032;1mARCH:\e[0m $arch ($lbit Bit)"
echo -e " \e[032;1mKERNEL TYPE:\e[0m $kernel"
echo -e " \e[032;1mCPU MODEL:\e[0m $cname"
echo -e " \e[032;1mNUMBER OF CORES:\e[0m $cores"
echo -e " \e[032;1mCPU FREQUENCY:\e[0m $freq MHz"
echo -e " \e[032;1mTOTAL RAM:\e[0m $tram Total / $uram Used"
echo -e " \e[032;1mTOTAL STORAGE:\e[0m $disk_total_size Total / $disk_used_size Used"
if [ "$swap" != "0" ]; then
echo -e " \e[032;1mTOTAL SWAP:\e[0m $swap Total / $uswap Used"
fi
echo -e " \e[032;1mISP NAME:\e[0m $ISP"
echo -e " \e[032;1mCITY:\e[0m $CITY"
echo -e " \e[032;1mREGION:\e[0m $REGION"
echo -e " \e[032;1mTIME:\e[0m $WKT"
echo -e " \e[032;1mIP VPS:\e[0m $IPVPS"
echo -e " \e[032;1mDOMAIN:\e[0m $DOMAIN"
echo -e " \e[032;1mNS DOMAIN:\e[0m $nsdomain"
echo -e " \e[032;1mXRAY VERSION:\e[0m $xrayversion"
echo -e " \e[032;1mCLIENT NAME:\e[0m $clientname"
echo -e " \e[032;1mEXPIRED DATE:\e[0m $exp [$diff_days days remaining]"
echo -e " \e[032;1mSCRIPT VERSION:\e[0m $SCVERSION"
echo -e " \e[032;1mSYSTEM UPTIME:\e[0m $up"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "\E[41;1;37m                 ⇱ SERVICE INFORMATION ⇲                \E[0m"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
status="$(systemctl show ssh.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " SSH               : SSH Service is "$green"Running"$NC""
else
echo -e " SSH               : SSH Service is "$red"Not Running"$NC""
fi
status="$(systemctl show udp-custom.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " SSH UDP           : SSH UDP Service is "$green"Running"$NC""
else
echo -e " SSH UDP           : SSH UDP Service is "$red"Not Running"$NC""
fi
status="$(systemctl show cdn.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " SSH WEBSOCKET     : SSH Websocket Service is "$green"Running"$NC""
else
echo -e " SSH WEBSOCKET     : SSH Websocket Service is "$red"Not Running"$NC""
fi
status="$(systemctl show openvpn.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " OVPN              : OVPN Service is "$green"Running"$NC""
else
echo -e " OVPN              : OVPN  Service is "$red"Not Running"$NC""
fi
status="$(systemctl show cdn-ovpn.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " OVPN WEBSOCKET    : OVPN Websocket Service is "$green"Running"$NC""
else
echo -e " OVPN WEBSOCKET    : OVPN Websocket Service is "$red"Not Running"$NC""
fi
status="$(systemctl show stunnel5.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " STUNNEL5          : Stunnel5 Service is "$green"Running"$NC""
else
echo -e " STUNNEL5          : Stunnel5 Service is "$red"Not Running"$NC""
fi
status="$(systemctl show slowdns.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " SLOWDNS           : Slowdns Service is "$green"Running"$NC""
else
echo -e " SLOWDNS           : Slowdns Service is "$red"Not Running"$NC""
fi
status="$(systemctl show squid.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " SQUID             : Squid Service is "$green"Running"$NC""
else
echo -e " SQUID             : Squid Service is "$red"Not Running"$NC""
fi
status="$(systemctl show dropbear.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " DROPBEAR          : DropBear Service is "$green"Running"$NC""
else
echo -e " DROPBEAR          : DropBear Service is "$red"Not Running"$NC""
fi
status="$(systemctl show xray.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " XRAY TLS          : XRAY TLS Service is "$green"Running"$NC""
else
echo -e " XRAY TLS          : XRAY TLS Service is "$red"Not Running"$NC""
fi
status="$(systemctl show xray@none.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " XRAY NTLS         : XRAY NTLS Service is "$green"Running"$NC""
else
echo -e " XRAY NTLS         : XRAY NTLS Service is "$red"Not Running"$NC""
fi
status="$(systemctl show xl2tpd.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " L2TP              : L2TP Service is "$green"Running"$NC""
else
echo -e " L2TP              : L2TP Service is "$red"Not Running"$NC""
fi
status="$(systemctl show nginx.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " NGINX             : Nginx Service is "$green"Running"$NC""
else
echo -e " NGINX             : Nginx Service is "$red"Not Running"$NC""
fi
status="$(systemctl show cron.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " CRON              : Cron Service is "$green"Running"$NC""
else
echo -e " CRON              : Cron Service is "$red"Not Running"$NC""
fi
status="$(systemctl show cron.service --no-page)"
status_text=$(echo "${status}" | grep 'ActiveState=' | cut -f2 -d=)
if [ "${status_text}" == "active" ]
then
echo -e " FAIL2BAN          : Fail2ban Service is "$green"Running"$NC""
else
echo -e " FAIL2BAN          : Fail2ban Service is "$red"Not Running"$NC""
fi
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

echo -e  ""
echo -e  "               type \033[1;91mmenu\e[0m to continue"
echo -e  ""
