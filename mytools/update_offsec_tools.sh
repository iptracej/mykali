#!/usr/bin/bash

DIR=/opt

enum=(
    'AutoRecon'
    'enum4linux-ng'
    'ffuf'
    'sparta'
    'SecLists'
)

privesc=(
    'PEASS-ng'
    'linux/LinEnum'
    'linux/linux-exploit-suggester'
    'linux/linux-exploit-suggester-2'
    'linux/linux-smart-enumeration'
    'windows/UACME'
    'windows/wesng'
    'windows/Windows-Exploit-Suggester'
    'windows/WinPwn'
)

powershell=(
    'ADModule'
    'ADRecon'
    'BC-SECURITY-Empire'
    'nishang'
    'PowerSploit'
    'PrivescCheck'
)

post=(
    'spraykatz'
    'CrackMapExec'
    'ACLight'
    'ad/kerbrute'
    'ad/mitm6'
    'ad/linWinPwn'
    'ad/noPac'
    'ad/DomainPasswordSpray'

)

fuzz=(
    'wfuzz'
    'fuzzdb'
    'fuzzdb-2'
)

passcrack=(
    'DPAT'
    'vncpwd'
    'hashcat-rule'
    'LaZagne'
    'OneRuleToRuleThemStill'
)

python=(
    'impacket'
)

SecLists=(
    ''
)

shell=(
    'C-Reverse-Shell'
    'evil-winrm'
    'Tiny-PHP-Webshell'
    'WebShell'
    'windows-php-reverse-shell'
)

viewer=(
    'evtx'
)

function gitPull() # $1=directory name $2=tool name

{
    dirName=$1
    toolName=$2
    echo '+'$toolName
    cd /opt/$dirName/$toolName
    git pull
    echo ''
	
}

function update_bloodhound()
{

    cd /opt/post/BloodHound/

    wget -N https://github.com/BloodHoundAD/BloodHound/releases/download/v4.3.1/BloodHound-linux-x64.zip
    wget -N https://github.com/BloodHoundAD/BloodHound/releases/download/v4.3.1/BloodHound-win32-x64.zip
    
    cd /opt/post/BloodHound/BloodHound/

    git pull 
    
}

function update_autorecon()
{
    cd /opt/enum/AutoRecon/
    chmod 755 autorecon.py
    sudo python3 -m pip install -r requirements.txt

}

function update() # $1:directory name
{
    a=$1'[@]'
    for i in "${!a}";
    do
    
    cd $DIR/$1/$i

    git stash
	gitPull $1 $i
    
    done
}	 

update "enum"
##update_autorecon
update "privesc"
update "powershell"
update "post"
update "fuzz"
update "passwordcrack"
update "python"
update "shell" 
update_bloodhound
