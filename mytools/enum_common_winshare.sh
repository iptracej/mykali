#!/bin/bash
# Author: iptracej
# Date: 2023-12-21
# Version: 1.0
# Description: Enumerate common Windows OS shares - C$, D$, ADMIN$, IPC$, PRINT$, FAX$, SYSVOL, NETLOGON
# Usage: ./enum_common_winshare.sh ip [[domain/]username[%password]]
# Example: ./enum_common_winshare.sh

if [[ -z $1 ]]; then 
    echo "Description: Enumerate common Windows OS shares - C$, D$, ADMIN$, IPC$, PRINT$, FAX$, SYSVOL, NETLOGON with smbclient"
    echo "Usage:      ./enum_common_winshare.sh ip [[domain/]username[%password]]"
    echo ""
    echo "Example:    ./enum_common_winshare.sh $RHOST  # null session" 
    echo "            ./enum_common_winshare.sh $RHOST baby2/library%library" 

    exit 1
else
    ip=$1
fi

username=${2:-'%'}

shares=('C$' 'D$' 'ADMIN$' 'IPC$' 'PRINT$' 'FAX$' 'SYSVOL' 'NETLOGON')

for share in "${shares[@]}"; do
    echo "[*] Trying to create a session for $share with $username. % is null session"
    smbclient "\\\\$ip\\$share" -U "$username" -c 'ls'
done