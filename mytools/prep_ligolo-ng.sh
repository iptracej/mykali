#!/usr/bin/bash

# This script prepares tools and links for LFI exploitation

dir="net/ligolo-ng"

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
	cp /opt/net/ligolo-ng/* $dir
	
	echo "Copying all tools...done"
	ls $dir
    else
	echo "No $dir directory exists"
    fi

	if [[ -f ~/.local/bin/proxy ]]
	then
		echo "Copying proxy to ~/.local/bin"
		rm ~/.local/bin/proxy -rf
		cp /opt/net/ligolo-ng/proxy ~/.local/bin/proxy
	fi

fi

