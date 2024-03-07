#!/bin/bash
clear
apt install lolcat
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

figlet -f small -t "MANSUR" | lolcat

	#Choose External Port
	echo "Masukan Port Yang Mau Anda Pointing"
	read -r "extport"

	#Find vpn address
	echo "Masukan IP Yang Ingin Anda Pointing"
	read "vpsip"

	#Find Internal port
	echo "Masukan Port Yang Ingin Di Direct Dari Vps Ini"
	echo "contoh jika ingin pointing ke mode ssh ssl gunakan port stunnel"
	read "intport"

	#What protocol

	echo "Masukan protocol tcp / udp / tcp/udp"
	read protocol
	if [ \( "$protocol" == "tcp" \) -o \( "$protocol" == "udp" \) -o \( "$protocol" == "tcp/udp" \) ]
	then
		echo "Selesai"
	else
		echo "Maaf, anda harus menetukan protocol !!!"
		exit
	fi

	#Periksa kembali dengan pengguna apakah ini konfigurasi yang benar
	echo "Apakah konfigurasi ini sudah benar ?"
	echo "$vpsip Dengan Protocol $protocol Dan $extport Sebagai Port Yang Di Pointing ? [y/n]"
	read "konfirmasi"

	#Execution
	if [ "$konfirmasi" == "y" ]
	then

		if [ "$protocol" == "tcp" ]
		then
			iptables -A PREROUTING -t nat -i  ens4 -p tcp --dport "$extport" -j DNAT --to "$vpsip":"$intport"
			iptables -A FORWARD -p tcp -d "$vpsip" --dport "$extport" -j ACCEPT
			iptables -t nat -A PREROUTING -p tcp --dport $extport -j DNAT --to-destination $vpsip:$intport
			iptables -t nat -A POSTROUTING -p tcp -d $vpsip --dport $extport -j SNAT --to-source $vpsip
		fi

		if [ "$protocol" == "udp" ]
		then
			iptables -A PREROUTING -t nat -i ens4 -p udp --dport "$extport" -j DNAT --to "$vpsip":"$intport"
			iptables -A FORWARD -p udp -d "$vpsip" --dport "$extport" -j ACCEPT
			iptables -t nat -A PREROUTING -p udp --dport $extport -j DNAT --to-destination $vpsip:$intport
			iptables -t nat -A POSTROUTING -p udp -d $vpsip --dport $extport -j SNAT --to-source $vpsip
		fi

		if [ "$protocol" == "tcp/udp" ]
		then
			iptables -A PREROUTING -t nat -i  ens4 -p tcp --dport "$extport" -j DNAT --to "$vpsip":"$intport"
			iptables -A FORWARD -p tcp -d "$vpsip" --dport "$extport" -j ACCEPT
			iptables -A PREROUTING -t nat -i ens4 -p udp --dport "$extport" -j DNAT --to "$vpsip":"$intport"
			iptables -A FORWARD -p udp -d "$vpsip" --dport "$extport" -j ACCEPT
			iptables -t nat -A PREROUTING -p tcp --dport $extport -j DNAT --to-destination $vpsip:$intport
			iptables -t nat -A POSTROUTING -p tcp -d $vpsip --dport $extport -j SNAT --to-source $vpsip
			iptables -t nat -A PREROUTING -p udp --dport $extport -j DNAT --to-destination $vpsip:$intport
			iptables -t nat -A POSTROUTING -p udp -d $vpsip --dport $extport -j SNAT --to-source $vpsip
		fi

	else
		echo "Script Terminating"
		exit
	fi

	#Asking To Save rules
	echo "Apakah Anda ingin menyimpan pengaturan ? [y/n]"
	read "simpan"

	if [ "$simpan" == "y" ]
	then
		echo "Menyimpan"
		iptables-save > /etc/iptables.up.rules
		iptables-restore -t < /etc/iptables.up.rules
		netfilter-persistent save
		netfilter-persistent reload
	fi

	#Reminder to port foward server side
	clear
	echo "Selesai ! Jika Tidak Berhasil Pastikan Vps Yang Ingin Dipointing Sudah Di Open All Port"