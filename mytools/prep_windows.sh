#!/usr/bin/bash

# This script prepares tools and links for Windows privilege escalation. 


function privesc()
{    
    dir=$1

    if [[ -d $PWD/$dir ]]
    then
	cp /opt/privesc/windows/privesc.bat $dir
	cp /opt/privesc/PEASS-ng/winPEAS/winPEASbat/winPEAS.bat $dir
	cp /opt/privesc/PEASS-ng/winPEAS/winPEASany.exe $dir
	cp /opt/privesc/PEASS-ng/winPEAS/winPEASx64.exe $dir
	cp /opt/privesc/PEASS-ng/winPEAS/winPEASx86.exe $dir
	cp /opt/privesc/windows/collection/accesschk.exe $dir
	cp /opt/privesc/windows/collection/accesschk64.exe $dir
	cp /opt/privesc/windows/collection/accesschk64a.exe $dir
	cp /opt/privesc/windows/collection/nc64.exe $dir
	cp /opt/privesc/windows/collection/nc.exe $dir
	cp /opt/privesc/windows/collection/strings64.exe $dir
	cp /opt/privesc/windows/collection/strings.exe $dir
	cp /opt/privesc/windows/collection/PsExec64.exe $dir
	cp /opt/privesc/windows/collection/PsExec.exe $dir
	cp /opt/privesc/windows/collection/wget.exe $dir
	cp /opt/privesc/windows/collection/wget64.exe $dir
	cp /opt/privesc/windows/collection/Powerless.bat $dir
	cp /opt/privesc/windows/win.zip $dir
	cp /opt/privesc/windows/unzip.vbs $dir
	cp /opt/privesc/windows/Ghostpack-CompiledBinaries/Seatbelt.exe $dir
	cp /opt/csharp/RunasCs.exe $dir
	cp /opt/static/nmap-7.92-win32.zip $dir
	cp /opt/static/nmap-7.80SVN-x86_64-a36a34aa6-portable.tar.gz $dir


	# Powershell
	
	cp /opt/powershell/PrivescCheck/PrivescCheck.ps1 $dir
	cp /opt/powershell/BC-SECURITY-Empire/empire/server/data/module_source/privesc/PowerUp.ps1 $dir
	cp /opt/powershell/BC-SECURITY-Empire/empire/server/data/module_source/privesc/PowerUp.ps1 $dir
	cp /opt/powershell/BC-SECURITY-Empire/empire/server/data/module_source/privesc/Invoke-winPEAS.ps1 $dir
	cp /opt/powershell/nishang/Shells/Invoke-PowerShellTcp.ps1 $dir
	cp /opt/powershell/AMSI/my-am-bypass.ps1 $dir
	cp /opt/powershell/ADRecon/ADRecon.ps1 $dir
	cp /opt/filetransfer/SMB2.ps1 $dir
	cp /opt/powershell/Invoke-RunasCs.ps1 $dir


	# AD Enumeration
	
	cp /opt/powershell/ADModule/Import-ActiveDirectory.ps1 $dir
	cp /opt/powershell/ADRecon/ADRecon.ps1 $dir
	cp /opt/powershell/PowerSploit/Recon/PowerView.ps1 $dir
	cp /opt/powershell/AMSI/my-am-bypass.ps1 $dir
	cp /opt/powershell/AMSI/amsi.txt $dir
	cp /opt/powershell/adPEAS/adPEAS.ps1 $dir


	# Potato
	cp /opt/privesc/windows/PrintSpoofer64.exe $dir
	cp /opt/privesc/windows/PrintSpoofer64.exe $dir
	cp /opt/privesc/windows/GodPotato-NET4.exe $dir
	cp /opt/privesc/windows/SigmaPotato.exe $dir

	echo "" && echo "privesc directory" && echo ""
	ls $dir

	echo ""
	echo "For wesng, you should copy systeminfo file to /opt/privesc/windows/wesng/"
	echo "For Windows-Exploit-Suggester,you should copy systeminfo to /opt/privesc/windows/Windows-Exploit-Suggester/"
	echo "For winpeas, grab the latest one - https://github.com/carlospolop/PEASS-ng/releases"
    else
	echo "No $dir directory exists"
    fi
}

function post()
{
    dir=$1

    if [[ -d $PWD/$dir ]]
    then
	
	cp /opt/post/mimikatz32.exe $dir
	cp /opt/post/mimikatz64.exe $dir

	cp /opt/post/mimikatz/mimikatz/Win32/mimikatz.exe $dir/mimikatz32-parotsec.exe
	cp /opt/post/mimikatz/mimikatz/x64/mimikatz.exe $dir/mimikatz64-parotsec.exe
		
	cp /opt/post/mimikatz-2.1.1/Win32/mimikatz.exe $dir/mimikatz32-2-1-1.exe
	cp /opt/post/mimikatz-2.1.1/x64/mimikatz.exe $dir/mimikatz64-2-1-1.exe
	cp /opt/powershell/nishang/Gather/Invoke-Mimikatz.ps1 $dir
	cp /opt/powershell/BC-SECURITY-Empire/empire/server/data/module_source/credentials/Invoke-Kerberoast.ps1 $dir
	#cp /opt/powershell/Empire/empire/server/data/module_source/situational_awareness/network/BloodHound.ps1 $dir
	#cp /opt/post/BloodHound/Collectors/SharpHound.ps1 $dir
	cp /opt/post/BloodHound/SharpHound.exe $dir
	cp /opt/post/BloodHound/BloodHound/Collectors/SharpHound.ps1 $dir
	cp /opt/post/ad/Rubeus.exe $dir
	cp /opt/post/ad/Rubeusx86.exe $dir
	cp /opt/post/ad/DomainPasswordSpray/DomainPasswordSpray.ps1 $dir
	cp /opt/post/ad/kerbrute/kerbrute_linux_amd64* $dir
	
	ln -s /opt/powershell/BC-SECURITY-Empire/empire/server/data/module_source/ $dir/empire

	echo "" && echo "post directory" && echo ""
	ls $dir

    else
	echo "No $dir directory exists"
	
    fi
    echo ""
}

function remove()
{
    dir=$1
    if [[ -d $PWD/$dir ]]
    then
	rm -rf $PWD/$dir/*
    fi
}

function usage()
{
    echo "prep_windows.sh [OPTION]"
    echo "This will copy all useful files to privesc and post directories. By default, copy files to privesc directory."
    echo ""
    echo "(No Option)      Copy files to privesc directory"
    echo "-h --help        Show this usage"
    echo "-r --remove      Remove all files of privesc and post"
    echo "--privesc        Copy files to privesc directory"
    echo "--post           Copy files to post directory"
    echo "-a --all         Copy all files to privesc and post directories"
    echo ""

}

while [ "$1" != "" ]; do
    OPTION=`echo $1 | awk -F= '{print $1}'`

    case $OPTION in
        -h | --help)
            usage
            exit
            ;;
        -r | --remove)
	    remove privesc
	    remove post
	    exit
            ;;
	--privesc)
	    privesc privesc
	    exit
            ;;
        --post)
	    post post
	    exit
            ;;
	-a | --all)
	    post post
	    privesc privesc
	    exit
            ;;
	
        *)
            echo "ERROR: unknown parameter \"$PARAM\""
            usage
            exit 1
            ;;
    esac
    shift
done 

privesc privesc
post post
