#!/usr/bin/bash

# Last Modified: 2022-01-07 20:50:57 kali>

# I reuse the script from the site below and customize it. I simply show the raw NIC names on my Unix and ip addresses
# https://dev.to/brandonwallace/make-your-tmux-status-bar-100-better-with-bash-2fne

function ip_address() {

    # Loop through the interfaces and check for the interface that is up.
    for file in /sys/class/net/*; do
	iface=$(basename $file);
	read status < $file/operstate;
	[ "$status" == "up" ] && ip addr show $iface | awk '/inet /{printf "eth0*" $2" "}' # update the NIC name
    done
}

function vpn_connection() {

    # Check for tun0, tun1, and tun2 interfaces. You need to update the NIC names 
    [ -d /proc/sys/net/ipv4/conf/tun0 ] && ifconfig tun0 | grep 'inet ' | awk '{printf "tun0*" $2" "}'
    [ -d /proc/sys/net/ipv4/conf/tun1 ] && ifconfig tun1 | grep 'inet ' | awk '{printf "tun1*" $2" "}'
    [ -d /proc/sys/net/ipv4/conf/tun2 ] && ifconfig tun1 | grep 'inet ' | awk '{printf "tun2*" $2" "}'

}

function target_ipaddress() {

    [ -f $PWD/target* ] && awk '{printf "target*" $1 " "}' target*
	
}

function main() {

    # Comment out any function you do not need. 
    ip_address
    vpn_connection
    target_ipaddress
}

main
