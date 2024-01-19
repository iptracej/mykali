#!/usr/bin/bash

configfdir=/tmp/mykali/conf
bindir=/tmp/mykali/bin

main()
{
    echo "Creating mykali files..."
    
    mkdir /tmp/mykali -p
    mkdir /tmp/mykali/bin -p
    mkdir /tmp/mykali/conf -p

    cp /home/iptracej/bin/* $bindir
    cp /home/iptracej/.tmux.conf $configfdir
    cp /home/iptracej/.tmux/tmux-* $configfdir
    cp /home/iptracej/.bashrc $configfdir
    cp /home/iptracej/.bash_aliases $configfdir
    cp /home/iptracej/.config/fish/config.fish $configfdir

    echo ""
    echo "/tmp/mykali/conf"
    ls -al /tmp/mykali/conf
    echo ""
    echo "/tmp/mykali/bin"
    ls -al /tmp/mykali/bin
    echo ""
    echo "Creating mykali files...done"

}   

remove()
{
    echo "Removing mykali files..."
    rm /tmp/mykali -rf
    echo "Removing mykali files...done"
}

if [ $# -eq 0 ]; then
    main
    
fi

while [ $# -ne 0 ];do
      
      case "$1" in
	  -r|--remove)
	      remove
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