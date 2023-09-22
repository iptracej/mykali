# I like /opt/ space as user land as well as root so I gave permissions to users to store anything in /opt directory.
# >sudo su
# >chmod 777 /opt
# >exit
# > chmod 755 setup_tools.sh
# > cd /opt
# >./setup_offsectools.sh

#!/bin/bash

SCRIPT_VERSION=1.0

# change a directory to download all offec tools
DIR=/opt

# enum
enum()
{
    [ ! -d "$DIR/enum" ] && mkdir -p $DIR/enum

    cd $DIR/enum
    git clone https://github.com/Tib3rius/AutoRecon
    git clone https://github.com/cddmp/enum4linux-ng
    git clone https://github.com/ffuf/ffuf
    git clone https://github.com/kurobeats/fimap
    git clone https://github.com/rezasp/joomscan.git
    git clone https://github.com/SECFORCE/sparta
    git clone https://github.com/jtesta/ssh-audit
    git clone https://github.com/NickstaDB/BaRMIe
    git clone https://github.com/lgandx/Responder
    git clone https://github.com/danielmiessler/SecLists.git
    git clone https://github.com/swisskyrepo/SSRFmap
    git clone https://github.com/ropnop/windapsearch

    # Kerbrute
    wget https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_amd64 -o $HOME/.local/bin/kerbrute 
    chmod 755 $HOME/.local/bin/kerbrute

}

# fuzz
fuzz()
{
    [ ! -d "$DIR/fuzz" ] && mkdir -p $DIR/fuzz

    cd $DIR/fuzz
    git clone https://github.com/x90skysn3k/brutespray
    git clone https://github.com/Karmaz95/crimson
    git clone https://github.com/fuzzdb-project/fuzzdb
    git clone https://github.com/dipsec/fuzzdb-2
    git clone https://github.com/omurugur/OS_Command_Payload_List
    git clone https://github.com/lanjelot/patator
    git clone https://github.com/xmendez/wfuzz

}

# net
net()
{
    [ ! -d "$DIR/net" ] && mkdir -p $DIR/net
    [ ! -d "$DIR/net/chisel" ] && mkdir -p $DIR/net/chisel

    cd $DIR/net/chisel
    wget -O - https://github.com/jpillora/chisel/releases/download/v1.8.1/chisel_1.8.1_windows_386.gz | gzip -d > chisel_1.8.1_windows_386 | chmod 755 chisel_1.8.1_windows_386
    wget -O - https://github.com/jpillora/chisel/releases/download/v1.8.1/chisel_1.8.1_windows_amd64.gz | gzip -d > chisel_1.8.1_windows_amd64 | chmod 755 chisel_1.8.1_windows_amd64 
    wget -O - https://github.com/jpillora/chisel/releases/download/v1.8.1/chisel_1.8.1_linux_amd64.gz | gzip -d > chisel_1.8.1_linux_amd64 | chmod 755 chisel_1.8.1_linux_amd64 
    wget -O - https://github.com/jpillora/chisel/releases/download/v1.8.1/chisel_1.8.1_linux_386.gz | gzip -d > chisel_1.8.1_linux_386 | chmod 755 chisel_1.8.1_linux_386 

    cd $DIR/net
    git clone https://github.com/haad/proxychains
    
}

# passcrack
passcrack()
{
    [ ! -d "$DIR/passcrack" ] && mkdir -p $DIR/passcrack

    cd $DIR/passcrack
    git clone https://github.com/clr2of8/DPAT
    git clone https://github.com/jeroennijhof/vncpwd
    #sudo apt install pdfcrack
    git clone https://github.com/AlessandroZ/LaZagne
    git clone https://github.com/clem9669/hashcat-rule

}

# post (post exploitation)
post()
{
    [ ! -d "$DIR/post" ] && mkdir -p $DIR/post
    [ ! -d "$DIR/post/BloodHound" ] && mkdir -p $DIR/post/BloodHound
    
    cd $DIR/post/BloodHound
    #sudo apt install bloodhound
    wget https://github.com/BloodHoundAD/BloodHound/releases/download/4.2.0/BloodHound-linux-x64.zip
    wget https://github.com/BloodHoundAD/BloodHound/releases/download/4.2.0/BloodHound-win32-x64.zip
    wget https://github.com/BloodHoundAD/BloodHound/raw/master/Collectors/SharpHound.exe
    wget https://github.com/BloodHoundAD/BloodHound/blob/master/Collectors/SharpHound.ps1
    
    [ ! -d "$DIR/post/mimikatz" ] && mkdir -p $DIR/post/mimikatz
    
    cd $DIR/post/mimikatz
    wget https://github.com/gentilkiwi/mimikatz/releases/download/2.2.0-20220919/mimikatz_trunk.zip
    git clone https://github.com/ParrotSec/mimikatz

    cd $DIR/post
    git clone https://github.com/cyberark/ACLight
    git clone https://github.com/aas-n/spraykatz
    wget https://download.sysinternals.com/files/AdExplorer.zip

    # check /opt/ad directory
    #
    # ad/* 
    # mimikatz32.exe
    # mimikatz64.exe
    # mimikatz-2.1.1 
    #
    # all files above need to be copied from old kali
    
}

# powershell
powershell()
{
    [ ! -d "$DIR/powershell" ] && mkdir -p $DIR/powershell

    cd $DIR/powershell
    git clone https://github.com/samratashok/ADModule
    git clone https://github.com/adrecon/ADRecon
    git clone https://github.com/tokyoneon/Chimera
    git clone https://github.com/mishmashclone/BC-SECURITY-Empire
    git clone https://github.com/samratashok/nishang
    git clone https://github.com/PowerShellMafia/PowerSploit
    git clone https://github.com/itm4n/PrivescCheck

}

# privesc
privesc()
{
    [ ! -d "$DIR/privesc" ] && mkdir -p $DIR/privesc

    cd $DIR/privesc
    git clone https://github.com/carlospolop/PEASS-ng

    cd $DIR/privesc/PEASS-ng/linPEAS
    wget https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh
    chmod 755 linpeas.sh 

    cd $DIR/privesc/PEASS-ng/winPEAS
    wget https://github.com/carlospolop/PEASS-ng/releases/latest/download/winPEASany_ofs.exe
    wget https://github.com/carlospolop/PEASS-ng/releases/latest/download/winPEASany.exe
    wget https://github.com/carlospolop/PEASS-ng/releases/download/20230129/winPEASx64.exe
    wget https://github.com/carlospolop/PEASS-ng/releases/download/20230129/winPEASx64_ofs.exe
    wget https://github.com/carlospolop/PEASS-ng/releases/download/20230129/winPEASx86.exe
    wget https://github.com/carlospolop/PEASS-ng/releases/download/20230129/winPEASx86_ofs.exe
        
    [ ! -d "$DIR/privesc/linux" ] && mkdir -p $DIR/privesc/linux

    cd $DIR/privesc/linux
    git clone https://github.com/rebootuser/LinEnum
    git clone https://github.com/The-Z-Labs/linux-exploit-suggester
    git clone https://github.com/jondonas/linux-exploit-suggester-2
    git clone https://github.com/diego-treitos/linux-smart-enumeration
    git clone https://github.com/H74N/netcat-binaries

    wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy32
    wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy32s
    wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy64
    wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy64s

    git clone https://github.com/Anon-Exploiter/SUID3NUM

    wget https://github.com/liamg/traitor/releases/download/v0.0.14/traitor-386
    wget https://github.com/liamg/traitor/releases/download/v0.0.14/traitor-amd64

    git clone https://github.com/initstring/uptux

    [ ! -d "$DIR/privesc/windows" ] && mkdir -p $DIR/privesc/windows

    cd $DIR/privesc/windows
    git clone https://github.com/int0x33/nc.exe/
    wget https://download.sysinternals.com/files/AccessChk.zip
    git clone https://github.com/GhostPack/Rubeus
    git clone https://github.com/r3motecontrol/Ghostpack-CompiledBinaries
    git clone https://github.com/bitsadmin/wesng
    git clone https://github.com/AonCyberLabs/Windows-Exploit-Suggester
    git clone https://github.com/hfiref0x/UACME
    git clone https://github.com/S3cur3Th1sSh1t/WinPwn
    wget https://github.com/itm4n/PrintSpoofer/releases/download/v1.0/PrintSpoofer32.exe 
    wget https://github.com/itm4n/PrintSpoofer/releases/download/v1.0/PrintSpoofer64.exe

}

# sysinternals
sysinternals()
{
    [ ! -d "$DIR/sysinternals" ] && mkdir -p $DIR/sysinternals
    
    cd $DIR/sysinternals
    wget https://download.sysinternals.com/files/SysinternalsSuite.zip

}

# python
python()
{
    [ ! -d "$DIR/python" ] && mkdir -p $DIR/python

    cd $DIR/python
    git clone https://github.com/fortra/impacket
}

# shell
shell()
{
    [ ! -d "$DIR/shell" ] && mkdir -p $DIR/shell

    cd $DIR/shell
    git clone https://github.com/izenynn/c-reverse-shell
    git clone https://github.com/dev-frog/C-Reverse-Shell
    git clone https://github.com/Hackplayers/evil-winrm
    git clone https://github.com/bayufedra/Tiny-PHP-Webshell
    git clone https://github.com/Dhayalanb/windows-php-reverse-shell
    git clone https://github.com/xl7dev/WebShell
    git clone https://github.com/ivan-sincek/php-reverse-shell/tree/master/src/reverse

    [ ! -d "$DIR/shell/php-reverse-shell" ] && mkdir -p $DIR/shell/php-reverse-shell

    cd $DIR/shell/php-reverse-shell
    wget https://github.com/ivan-sincek/php-reverse-shell/archive/refs/tags/v2.5.1.tar.gz
    tar xvfz v2.5.1.tar.gz

    [ ! -d "$DIR/shell/php-reverse-shell-pentestmonkey" ] && mkdir -p $DIR/shell/php-reverse-shell-pentestmonkey

    cd $DIR/shell/php-reverse-shell-pentestmonkey
    git clone https://github.com/pentestmonkey/php-reverse-shell
    
}

# static
static()
{
    [ ! -d "$DIR/static" ] && mkdir -p $DIR/static

    cd $DIR/static
    wget https://github.com/ernw/static-toolbox/releases/download/1.04/nmap-7.80SVN-x86-a36a34aa6-portable.tar.gz
    wget clone https://github.com/ernw/static-toolbox/releases/download/1.04/nmap-7.80SVN-x86_64-a36a34aa6-portable.tar.gz
    wget clone https://github.com/ernw/static-toolbox/releases/download/tcpdump-v4.9.3/tcpdump-4.9.3-x86
    wget clone https://github.com/ernw/static-toolbox/releases/download/tcpdump-v4.9.3/tcpdump-4.9.3-x86_64
    wget clone https://github.com/ernw/static-toolbox/releases/download/openssh-v8.6p1/sshd-OpenSSH_8.6p1-x86
    wget clone https://github.com/ernw/static-toolbox/releases/download/openssh-v8.6p1/sshd-OpenSSH_8.6p1-x86_64

    wget https://github.com/andrew-d/static-binaries/raw/master/binaries/linux/x86_64/nmap
    wget https://github.com/andrew-d/static-binaries/raw/master/binaries/linux/x86_64/python
    wget https://github.com/pts/staticpython/raw/master/release/python2.7-static
    wget https://github.com/pts/staticpython/raw/master/release/python3.2-static

}

# misc
misc()
{
    [ ! -d "$DIR/misc" ] && mkdir -p $DIR/misc

    cd $DIR/misc
    git clone https://github.com/octobanana/peaclock
    git clone https://github.com/charmbracelet/glow

}

decompile()
{
    [ ! -d "$DIR/decompile" ] && mkdir -p $DIR/decompile
    git clone https://github.com/dnSpy/dnSpy  

}


usage()
{

    echo "setup_offsec_tools.sh v$SCRIPT_VERSION"
    echo "usage: $1 [OPTIONS]"
    echo "Options:"
    echo " -i|--install       install offsec tools"
    echo " -h|--help          display help"

}

main()
{
    echo "under construction"
    #enum
    #fuzz
    #decompile
    #misc
    #net
    #passcrack
    #post
    #powershell
    #privesc
    #python
    #sysinternals
    #shell 
    #static
    exit
}

if [ $# -eq 0 ]; then
    usage
    exit
fi

while [ $# -ne 0 ];do
      
      case "$1" in
	  -i|--install)
	      main
	      ;;
	  -h|--help)
	      usage
	      exit
	      ;;
	*)
	    echo "use -h or --help for detals"
	    echo "unknown arguments provided"
	    exit
	    ;;
      esac
done
