#!/usr/bin/bash

# This is one of my bash scripts for screenshot configuration (auto screencapture for every single command
# in fish envionrment. The fish shell is my sort of Unix shell tool for penetration testing because of
# various reasons such as autocompletion and easy UI customization. I am still keeping bash shell in my
# most of the envionrmnets. This is why this scritp exists. 

function usage
{
    echo "screenshot [stop|start|-h|--help]" 
}

while [ "$1" != "" ]; do
    OPTION=`echo $1 | awk -F= '{print $1}'`

    case $OPTION in
        -h | --help)
            usage
            exit
            ;;
        stop)
	    #sed -i 's/^.*flameshot/  ##flameshot/g' $HOME/.config/fish/config.fish
	    #fish
	    #source $HOME/.config/fish/config.fish
	    #exit
            ;;
	start)
	    #sed -i 's/^.*##flameshot/  flameshot/g' $HOME/.config/fish/config.fish
	    #fish
	    #source $HOME/.config/fish/config.fish_pentest
	    #exit
            ;;
        *)
            echo "ERROR: unknown parameter \"$PARAM\""
            usage
            exit 1
            ;;
    esac
    shift
done 
