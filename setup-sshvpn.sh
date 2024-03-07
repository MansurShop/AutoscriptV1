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
apt update -y
apt upgrade -y
apt install netfilter-persistent -y
apt install netcat -y
apt install python -y
apt install ruby -y
apt install make -y
apt install cmake -y
apt install coreutils -y
apt install rsyslog -y
apt install net-tools -y
apt install zip -y
apt install unzip -y
apt install nano -y
apt install sed -y
apt install gnupg -y
apt install gnupg1 -y
apt install bc -y
apt install jq -y
apt install apt-transport-https -y
apt install build-essential -y
apt install dirmngr -y
apt install libxml-parser-perl -y
apt install neofetch -y
apt install git -y
apt install lsof -y
apt install libsqlite3-dev -y
apt install libz-dev -y
apt install gcc -y
apt install g++ -y
apt install libreadline-dev -y
apt install zlib1g-dev -y
apt install libssl-dev -y
apt install libssl1.0-dev -y
apt install dos2unix -y
apt install python3-pip -y
apt-get install python3-setuptools -y
apt-get upgrade python3-setuptools -y
clear
domain=$(cat /etc/xray/domain)
source /etc/os-release
release=$ID
VERSION=$VERSION_ID
if [[ "${release}" == "debian" ]]; then
apt install gnupg2 ca-certificates lsb-release -y
echo "deb http://nginx.org/packages/mainline/debian $(lsb_release -cs) nginx" | tee /etc/apt/sources.list.d/nginx.list
echo -e "Package: *\nPin: origin nginx.org\nPin: release o=nginx\nPin-Priority: 900\n" | tee /etc/apt/preferences.d/99nginx
curl -o /tmp/nginx_signing.key https://nginx.org/keys/nginx_signing.key
mv /tmp/nginx_signing.key /etc/apt/trusted.gpg.d/nginx_signing.asc
apt update
elif [[ "${release}" == "ubuntu" ]]; then
apt install gnupg2 ca-certificates lsb-release -y
echo "deb http://nginx.org/packages/mainline/ubuntu $(lsb_release -cs) nginx" | tee /etc/apt/sources.list.d/nginx.list
echo -e "Package: *\nPin: origin nginx.org\nPin: release o=nginx\nPin-Priority: 900\n" | tee /etc/apt/preferences.d/99nginx
curl -o /tmp/nginx_signing.key https://nginx.org/keys/nginx_signing.key
mv /tmp/nginx_signing.key /etc/apt/trusted.gpg.d/nginx_signing.asc
apt update
elif [[ "${release}" == "centos" ]]; then
apt install yum-utils
cat <<EOF >/etc/yum.repos.d/nginx.repo
[nginx-stable]
name=nginx stable repo
baseurl=http://nginx.org/packages/centos/\$releasever/\$basearch/
gpgcheck=1
enabled=1
gpgkey=https://nginx.org/keys/nginx_signing.key
module_hotfixes=true
[nginx-mainline]
name=nginx mainline repo
baseurl=http://nginx.org/packages/mainline/centos/\$releasever/\$basearch/
gpgcheck=1
enabled=0
gpgkey=https://nginx.org/keys/nginx_signing.key
module_hotfixes=true
EOF
yum-config-manager --enable nginx-mainline
fi
if [[ $release == 'debian' ]]; then
adduser --system --no-create-home --shell /bin/false --group --disabled-login nginx
fi
mkdir -p /home/vps/public_html
apt install nginx -y
wget --no-check-certificate -q -O /etc/nginx/conf.d/default.conf "https://raw.githubusercontent.com/$repogithub/default.conf"
wget --no-check-certificate -q -O /etc/nginx/conf.d/alone.conf "https://raw.githubusercontent.com/$repogithub/alone.conf"
wget --no-check-certificate -q -O /etc/nginx/conf.d/vps.conf "https://raw.githubusercontent.com/$repogithub/vps.conf"
wget --no-check-certificate -q -O /etc/nginx/conf.d/vlnone.conf "https://raw.githubusercontent.com/$repogithub/vlnone.conf"
sed -i "s/domain_kamu/$domain/g" /etc/nginx/conf.d/alone.conf
sed -i "s/isi_domain/$domain/g" /etc/nginx/conf.d/vlnone.conf
systemctl daemon-reload
systemctl enable nginx
systemctl start nginx
systemctl restart nginx
export DEBIAN_FRONTEND=noninteractive
MYIP=$(wget -qO- ipinfo.io/ip);
MYIP2="s/xxxxxxxxx/$MYIP/g";
NET=$(ip -o $ANU -4 route show to default | awk '{print $5}');
source /etc/os-release
ver=$VERSION_ID
country=ID
state=Indonesia
locality=Indonesia
organization=william
organizationalunit=william
commonname=william
email=asistenwilliam@gmail.com
wget --no-check-certificate -q -O /etc/pam.d/common-password "https://raw.githubusercontent.com/MansurShop/AutoscriptV1/main/password"
chmod +x /etc/pam.d/common-password
cd
cat > /etc/systemd/system/rc-local.service <<-END
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local
[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99
[Install]
WantedBy=multi-user.target
END
cat > /etc/rc.local <<-END
exit 0
END
chmod +x /etc/rc.local
systemctl enable rc-local
systemctl start rc-local.service
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local
apt update -y
apt upgrade -y
apt dist-upgrade -y
apt-get remove --purge ufw firewalld -y
apt-get remove --purge exim4 -y
apt -y install wget curl
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config
apt-get --reinstall --fix-missing install -y bzip2 gzip coreutils wget screen rsyslog iftop htop net-tools zip unzip wget net-tools curl nano sed screen gnupg gnupg1 bc apt-transport-https build-essential dirmngr libxml-parser-perl neofetch git lsof
if grep -Fxq "menu2" .profile
then
echo "skipped added menu in profile (found)"
else
echo "clear" >> .profile
echo "menu2" >> .profile
fi
cd
wget --no-check-certificate -q -O /usr/bin/badvpn-udpgw "https://raw.githubusercontent.com/MansurShop/AutoscriptV1/main/badvpn-udpgw64"
chmod +x /usr/bin/badvpn-udpgw
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 512 --max-connections-for-client 10' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 512 --max-connections-for-client 10' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 512 --max-connections-for-client 10' /etc/rc.local
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
sed -i 's/Port 22/Port 22/g' /etc/ssh/sshd_config
cekubuntu22=$(lsb_release -a 2>/dev/null | awk '/Description/ {print $2, $3}' | cut -d. -f1)
if [[ "$cekubuntu22" = "Ubuntu 22" ]]; then
apt -y install dropbear
cat > /etc/default/dropbear << END
NO_START=0
DROPBEAR_PORT=143
DROPBEAR_EXTRA_ARGS="-p 109"
DROPBEAR_BANNER="/etc/issue.net"
DROPBEAR_RECEIVE_WINDOW=65536
END
cat > /lib/systemd/system/dropbear.service << END
[Unit]
Description=Lightweight SSH server
Documentation=man:dropbear(8)
After=network.target
[Service]
Environment=DROPBEAR_PORT=22 DROPBEAR_RECEIVE_WINDOW=65536
EnvironmentFile=-/etc/default/dropbear
ExecStart=/usr/sbin/dropbear -EF -p "$DROPBEAR_PORT" -W "$DROPBEAR_RECEIVE_WINDOW" $DROPBEAR_EXTRA_ARGS -b /etc/issue.net
KillMode=process
Restart=on-failure
[Install]
WantedBy=multi-user.target
END
sleep 2
systemctl daemon-reload
systemctl restart dropbear
else
apt -y install dropbear
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=143/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 109"/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS="-p 109""-p 109"/DROPBEAR_EXTRA_ARGS="-p 109"/g' /etc/default/dropbear
fi
if ! grep -qxF '/bin/false' /etc/shells ; then
echo "/bin/false" >> /etc/shells
fi
if ! grep -qxF '/usr/sbin/nologin' /etc/shells ; then
echo "/usr/sbin/nologin" >> /etc/shells
fi
sleep 1
/etc/init.d/dropbear restart
clear
source /etc/os-release
apt install squid -y
apt install squid3 -y
wget --no-check-certificate -q -O /etc/squid/squid.conf "https://raw.githubusercontent.com/MansurShop/AutoscriptV1/main/squid3.conf"
sed -i $MYIP2 /etc/squid/squid.conf
apt -y install vnstat
/etc/init.d/vnstat restart
apt -y install libsqlite3-dev
wget --no-check-certificate -q https://humdi.net/vnstat/vnstat-2.6.tar.gz
tar zxvf vnstat-2.6.tar.gz
cd vnstat-2.6
./configure --prefix=/usr --sysconfdir=/etc && make && make install
cd
vnstat -u -i $NET
sed -i 's/Interface "'""eth0""'"/Interface "'""$NET""'"/g' /etc/vnstat.conf
chown vnstat:vnstat /var/lib/vnstat -R
systemctl enable vnstat
/etc/init.d/vnstat restart
rm -f /root/vnstat-2.6.tar.gz
rm -rf /root/vnstat-2.6
mkdir -p /etc/stunnel/
cd /root
wget --no-check-certificate https://github.com/MansurShop/AutoscriptV1/raw/main/stunnel-5.70.tar.gz
tar -xzvf stunnel-5.70.tar.gz && rm -rf stunnel-5.70.tar.gz
cd stunnel-5.70 && rm -rf stunnel-5.70
./configure
make
make install
mv /usr/local/bin/stunnel /usr/local/bin/stunnel5
chmod +x /usr/local/bin/stunnel5
rm -rf /usr/local/bin/stunnel3
rm -rf /usr/local/bin/stunnel
touch /etc/stunnel/stunnel5.conf
touch /etc/stunnel/stunnel5.pem
cat > /etc/stunnel/stunnel.conf << END
cert = /etc/stunnel/stunnel5.pem
client = no
socket = a:SO_REUSEADDR=1
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1
[dropbear ws ssl]
accept = 6443
connect = 127.0.0.1:2052
[openvpn]
accept = 442
connect = 127.0.0.1:1194
END
openssl genrsa -out key.pem 2048
openssl req -new -x509 -key key.pem -out cert.pem -days 1095 \
-subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"
cat key.pem cert.pem >> /etc/stunnel/stunnel5.pem
cat > /etc/systemd/system/stunnel5.service << END
[Unit]
Description=Stunnel5 Service
Documentation=https://stunnel.org
Documentation=https://github.com/MansurShop
After=syslog.target network-online.target
[Service]
ExecStart=/usr/local/bin/stunnel5 /etc/stunnel/stunnel.conf
Type=forking
Restart=always
RestartSec=3
[Install]
WantedBy=multi-user.target
END
wget --no-check-certificate -q -O /etc/init.d/stunnel5 "https://raw.githubusercontent.com/MansurShop/AutoscriptV1/main/stunnel5.init"
chmod 600 /etc/stunnel/stunnel5.pem
chmod +x /etc/init.d/stunnel5
rm -r -f /usr/local/share/doc/stunnel/
rm -r -f /usr/local/etc/stunnel/
rm -f /usr/local/bin/stunnel
rm -f /usr/local/bin/stunnel3
rm -f /usr/local/bin/stunnel4
systemctl stop stunnel5
systemctl enable stunnel5
systemctl start stunnel5
systemctl restart stunnel5
/etc/init.d/stunnel5 restart
/etc/init.d/stunnel5 status
/etc/init.d/stunnel5 restart
wget --no-check-certificate -q https://raw.githubusercontent.com/$repogithub/vpn.sh &&  chmod +x vpn.sh && ./vpn.sh && rm -rf vpn.sh
apt -y install fail2ban
if [ -d '/usr/local/ddos' ]; then
rm -rf /usr/local/ddos
else
mkdir /usr/local/ddos
fi
clear
echo; echo 'Installing DOS-Deflate 0.6'; echo
echo; echo -n 'Downloading source files...'
wget --no-check-certificate -q -O /usr/local/ddos/ddos.conf http://www.inetbase.com/scripts/ddos/ddos.conf
echo -n '.'
wget --no-check-certificate -q -O /usr/local/ddos/LICENSE http://www.inetbase.com/scripts/ddos/LICENSE
echo -n '.'
wget --no-check-certificate -q -O /usr/local/ddos/ignore.ip.list http://www.inetbase.com/scripts/ddos/ignore.ip.list
echo -n '.'
wget --no-check-certificate -q -O /usr/local/ddos/ddos.sh http://www.inetbase.com/scripts/ddos/ddos.sh
chmod 0755 /usr/local/ddos/ddos.sh
cp -s /usr/local/ddos/ddos.sh /usr/local/sbin/ddos
echo '...done'
echo; echo -n 'Creating cron to run script every minute.....(Default setting)'
/usr/local/ddos/ddos.sh --cron > /dev/null 2>&1
echo '.....done'
echo; echo 'Installation has completed.'
echo 'Config file is at /usr/local/ddos/ddos.conf'
echo 'Please send in your comments and/or suggestions to zaf@vsnl.com'
echo "Banner /etc/issue.net" >>/etc/ssh/sshd_config
sed -i 's@DROPBEAR_BANNER=""@DROPBEAR_BANNER="/etc/issue.net"@g' /etc/default/dropbear
cat > "/etc/issue.net" << EOF
<p style="text-align:center"><span style=>
<BR><font color='#00ff36'>WELCOME TO PREMIUM SERVER</font>
<BR><font color='#5539fb'>===============================</font>
<BR><font color='#aa1df8'>PERATURAN SERVER PREMIUM </font>
<BR><font color='#5539fb'>===============================</font>
<BR><font color='#0056ff'> NO DDOS </font>
<BR><font color='#0080bf'> NO HACKING </font>
<BR><font color='#00ab80'> NO DOWNLOAD FILE TORRENT </font>
<BR><font color='#00d540'> MAX LOGIN 2 DEVICE/BITVICE </font>
<BR><font color='#00ff00'> MELANGGAR BANNED PERMANENT</font>
<BR><font color='#55aa75'>===============================</font>
<BR><font color='#aa55b5'>THANKYOU FOR USING OUR SERVICE</font>
<BR><font color='#0000ff'>===============================</font></font>
</p>
EOF
iptables -A INPUT -p tcp --dport 25 -j DROP
iptables -A INPUT -p tcp --dport 465 -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -A FORWARD -m string --algo bm --string "peer_id=" -j DROP
iptables -A FORWARD -m string --algo bm --string ".torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -A FORWARD -m string --algo bm --string "torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce" -j DROP
iptables -A FORWARD -m string --algo bm --string "info_hash" -j DROP
iptables -A FORWARD -m string --algo bm --string "/default.ida?" -j DROP
iptables -A FORWARD -m string --algo bm --string ".exe?/c+dir" -j DROP
iptables -A FORWARD -m string --algo bm --string ".exe?/c_tftp" -j DROP
iptables -A FORWARD -m string --string "peer_id" --algo kmp -j DROP
iptables -A FORWARD -m string --string "BitTorrent" --algo kmp -j DROP
iptables -A FORWARD -m string --string "BitTorrent protocol" --algo kmp -j DROP
iptables -A FORWARD -m string --string "bittorrent-announce" --algo kmp -j DROP
iptables -A FORWARD -m string --string "announce.php?passkey=" --algo kmp -j DROP
iptables -A FORWARD -m string --string "find_node" --algo kmp -j DROP
iptables -A FORWARD -m string --string "info_hash" --algo kmp -j DROP
iptables -A FORWARD -m string --string "get_peers" --algo kmp -j DROP
iptables -A FORWARD -m string --string "announce" --algo kmp -j DROP
iptables -A FORWARD -m string --string "announce_peers" --algo kmp -j DROP
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload
nsdomain=$(cat /etc/ns/domain)
apt install golang -y
apt install git -y
apt install dnsutils -y
apt update -y
apt install -y python3 python3-dnslib net-tools
apt install ncurses-utils -y
apt install dnsutils -y
apt install git -y
apt install curl -y
apt install wget -y
apt install ncurses-utils -y
apt install screen -y
apt install cron -y
apt install iptables -y
apt install -y git screen whois dropbear wget
apt install -y sudo gnutls-bin
apt install -y dos2unix debconf-utils
service cron reload
service cron restart
cd
sed -i 's/#AllowTcpForwarding yes/AllowTcpForwarding yes/g' /etc/ssh/sshd_config
service ssh restart
service sshd restart
git clone https://www.bamsoftware.com/git/dnstt.git
cd dnstt/dnstt-server
go build
cd
cd dnstt/dnstt-client
go build
mkdir -m 777 /etc/william/slowdns/
mkdir -p /etc/william/slowdns/
touch /etc/william/slowdns/server.key
touch /etc/william/slowdns/server.pub
cd /etc/william/slowdns/
wget --no-check-certificate -q -O /etc/william/slowdns/dns-server "https://raw.githubusercontent.com/MansurShop/AutoscriptV1/main/dns-server"
chmod +x /etc/william/slowdns/dns-server
cd /etc/william/slowdns/
./dns-server -gen-key -privkey-file /etc/william/slowdns/server.key -pubkey-file /etc/william/slowdns/server.pub
cd /root
iptables -I INPUT -p udp --dport 5300 -j ACCEPT
iptables -t nat -I PREROUTING -p udp --dport 53 -j REDIRECT --to-ports 5300
netfilter-persistent save
netfilter-persistent reload
cat > /etc/systemd/system/slowdns.service << END
[Unit]
Description=SLOWDNS BY WILLIAM
Documentation=https://t.me/mansurrshop
After=network.target nss-lookup.target
[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/etc/william/slowdns/dns-server -udp :5300 -privkey-file /etc/william/slowdns/server.key $nsdomain 127.0.0.1:22
Restart=on-failure
[Install]
WantedBy=multi-user.target
END
systemctl daemon-reload
systemctl enable slowdns
systemctl start slowdns
systemctl restart slowdns
cd /usr/bin
echo "PLEASE WAIT......"
wget --no-check-certificate -q -O hapus "https://raw.githubusercontent.com/$repogithub/hapus.sh"
wget --no-check-certificate -q -O member "https://raw.githubusercontent.com/MansurShop/AutoscriptV1/main/member.sh"
wget --no-check-certificate -q -O cek "https://raw.githubusercontent.com/MansurShop/AutoscriptV1/main/cek.sh"
wget --no-check-certificate -q -O info "https://raw.githubusercontent.com/MansurShop/AutoscriptV1/main/info.sh"
wget --no-check-certificate -q -O ram "https://raw.githubusercontent.com/MansurShop/AutoscriptV1/main/ram.sh"
wget --no-check-certificate -q -O renew "https://raw.githubusercontent.com/$repogithub/renew.sh"
wget --no-check-certificate -q -O autokill "https://raw.githubusercontent.com/MansurShop/AutoscriptV1/main/autokill.sh"
wget --no-check-certificate -q -O ceklim "https://raw.githubusercontent.com/MansurShop/AutoscriptV1/main/ceklim.sh"
wget --no-check-certificate -q -O wbmn "https://raw.githubusercontent.com/MansurShop/AutoscriptV1/main/webmin.sh"
wget --no-check-certificate -q -O tcp-tweaker "https://raw.githubusercontent.com/MansurShop/AutoscriptV1/main/tcp-tweaker.sh"
wget --no-check-certificate -q -O pointing-vps "https://raw.githubusercontent.com/MansurShop/AutoscriptV1/main/pointing-vps.sh"
wget --no-check-certificate -q -O tendang "https://raw.githubusercontent.com/MansurShop/AutoscriptV1/main/tendang.sh"
chmod +x tendang
chmod +x hapus
chmod +x member
chmod +x cek
chmod +x speedtest
chmod +x info
chmod +x autokill
chmod +x ceklim
chmod +x ram
chmod +x renew
chmod +x clear-log
chmod +x wbmn
chmod +x tcp-tweaker
chmod +x pointing-vps
echo "0 0 * * * root del-exp" >> /etc/crontab
echo "0 5 * * * root clear-log" >> /etc/crontab
echo "0 4 1 * * root auto-certxray" >> /etc/crontab
cd
apt autoclean -y
apt -y remove --purge unscd
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove bind9*;
apt-get -y remove sendmail*
apt autoremove -y
cd
chown -R www-data:www-data /home/vps/public_html
/etc/init.d/nginx restart
/etc/init.d/openvpn restart
/etc/init.d/cron restart
/etc/init.d/ssh restart
/etc/init.d/dropbear restart
/etc/init.d/fail2ban restart
/etc/init.d/stunnel5 restart
/etc/init.d/vnstat restart
/etc/init.d/squid restart
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 512 --max-connections-for-client 10
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 512 --max-connections-for-client 10
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 512 --max-connections-for-client 10
history -c
echo "unset HISTFILE" >> /etc/profile
cd
rm -f /root/key.pem
rm -f /root/cert.pem
rm -f /root/ssh-vpn.sh
echo "1" > /home/ver
clear
apt install figlet
apt install lolcat
echo "sslh sslh/inetd_or_standalone select standalone" | debconf-set-selections
yes | apt-get install sslh
wget --no-check-certificate -q -O /usr/sbin/sslh "https://github.com/MansurShop/AutoscriptV1/raw/main/sslh"
chmod +x /usr/sbin/sslh
cat > /etc/default/sslh << END
DAEMON=/usr/sbin/sslh
DAEMON_OPTS="--user sslh --listen 0.0.0.0:443 --ssh 127.0.0.1:22 --tls 127.0.0.1:1369 --openvpn 127.0.0.1:1194 --anyprot 127.0.0.1:109 --pidfile /var/run/sslh/sslh.pid"
END
cat > /lib/systemd/system/sslh.service << END
[Unit]
Description=SSL/SSH multiplexer
After=network.target
Documentation=man:sslh(8)
[Service]
EnvironmentFile=/etc/default/sslh
ExecStart=/usr/sbin/sslh --foreground \$DAEMON_OPTS
KillMode=process
Restart=always
RestartSec=3
[Install]
WantedBy=multi-user.target
END
systemctl daemon-reload
systemctl enable sslh
systemctl start sslh
systemctl restart sslh
apt-get install curl -y
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | bash
apt-get install speedtest -y
