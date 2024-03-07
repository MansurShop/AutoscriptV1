#!/bin/bash
clear
if [ "${EUID}" -ne 0 ]; then
                echo "You need to run this script as root"
                exit 1
fi
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$( curl https://raw.githubusercontent.com/MansurShop/Permission/main/Nxbdjekkwso.txt | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${green}Permission Accepted${NC}"
else
echo -e "${red}Permission Denied!${NC}";
echo "Only For Premium Users"
echo "Contact t.me/mansurrshop"
exit 0
fi
tput setaf 7 ; tput setab 1 ; tput bold ; printf '%35s%s%-20s\n' "TCP Tweaker 1.2" ; tput sgr0
if [[ `grep -c "^#PH56" /etc/sysctl.conf` -eq 1 ]]
then
        echo ""
        echo "TCP Tweaker network settings have already been added to the system!"
        echo ""
        read -p "Do you want to remove TCP Tweaker settings? [y/n]: " pilihan
        if [[ "$pilihan" = 'y' ]]; then
                grep -v "^#PH56
net.ipv4.tcp_window_scaling = 1
net.core.rmem_max = 16777216
net.core.wmem_max = 16777216
net.ipv4.tcp_rmem = 4096 87380 16777216
net.ipv4.tcp_wmem = 4096 16384 16777216
net.ipv4.tcp_low_latency = 1
net.ipv4.tcp_slow_start_after_idle = 0" /etc/sysctl.conf > /tmp/syscl && mv /tmp/syscl /etc/sysctl.conf
sysctl -p /etc/sysctl.conf > /dev/null
                clear
                echo ""
                echo "TCP Tweaker network settings were successfully removed."
                echo ""
        exit
        else
                echo ""
                exit
        fi
else
        echo ""
        echo "This tools will change some network settings"
        echo "to reduce latency and improve speed."
        echo ""
        read -p "Continue To Install? [y/n]: " pilihan
        if [[ "$pilihan" = 'y' ]]; then
        echo ""
        echo "Modifying the following settings:"
        echo " " >> /etc/sysctl.conf
        echo "#PH56" >> /etc/sysctl.conf
echo "net.ipv4.tcp_window_scaling = 1
net.core.rmem_max = 16777216
net.core.wmem_max = 16777216
net.ipv4.tcp_rmem = 4096 87380 16777216
net.ipv4.tcp_wmem = 4096 16384 16777216
net.ipv4.tcp_low_latency = 1
net.ipv4.tcp_slow_start_after_idle = 0" >> /etc/sysctl.conf
echo ""
sysctl -p /etc/sysctl.conf
                clear
                echo ""
                echo "TCP Tweaker network settings have been added successfully."
                echo ""
        else
                echo ""
                echo "Installation was canceled by the user!"
                echo ""
        fi
fi
exit