#!/usr/bin/bash

# Run this script with a user privilege 
# Ensure that your user account has a sudo privilege
# >getent group sudo
# >chmod 755 install.sh
# >./install.sh


dot_dir=(
    '.local/bin'
    '.local/share'
    '.config/fish'
    '.tmux'
)

# core=(
# 	'flameshot'
# 	'terminator'
# 	'sshfs'
# 	'emacs'
# 	'python3-pyftpdlib'
# 	'gcc-mingw-w64'
# 	'tmux'
# )

# fish=(
#     'fish'
#     'font-manager'
#     'exa'
#     'peco'
# )

# function install()
# {
# 	a=$1'[@]'
# 	for i in "${!a}";
#     	do
# 	    sudo apt-get -y install $i && echo ""
#     	done
# }

# function create_dir()
# {
#     a=$1'[@]'
#     for i in "${!a}";
#     do
# 	mkdir -p $i
#     done
# }

# function set_timezone()
# {
#     sudo timedatectl set-timezone America/Los_Angeles
#     sudo timedatectl
# }

# function apt_get_update()
# {
#     sudo apt-get update && echo ""
# }

# function nmap()
# {
# 	sudo getcap /usr/bin/nmap
# 	sudo setcap cap_net_raw,cap_net_admin,cap_net_bind_service+eip /usr/bin/nmap
# 	sudo getcap /usr/bin/nmap
# }

# function setup_tmux()
# {

#     cd $HOME
#     mkdir -p .tmux
#     sudo apt-get install xsel
#     touch $HOME/.hushlogin
#     [ ! -d "$HOME/.tmux/plugins/tpm" ] && git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

#     wget -O .tmux.conf https://raw.githubusercontent.com/kiwatana/PentestEnvironment/main/.tmux.conf -P $HOME/ 
#     wget -O config.fish https://raw.githubusercontent.com/kiwatana/PentestEnvironment/main/config.fish -P $HOME/.config/fish 
#     wget -O tmux-copy.sh https://raw.githubusercontent.com/kiwatana/PentestEnvironment/main/tmux-copy.sh -P $HOME/.tmux
#     wget -O tmux-ip.sh https://raw.githubusercontent.com/kiwatana/PentestEnvironment/main/tmux-ipaddress-display.sh -P $HOME/.tmux    

# }

# function setup_emacs()
# {
#     if [ -d $HOME/.emacs.d ]
#     then
# 	mkdir -p $HOME/.emcas.d/backups

# 	if [ ! -f $HOME/.emacs.d/init.el ]
# 	then
# 	    touch $HOME/.emacs.d/init.el
# 	    # Ensure you add backup script in init.el
# 	    # https://www.gnu.org/software/emacs/manual/html_node/tramp/Auto_002dsave-File-Lock-and-Backup.html
# 	    # (add-to-list 'backup-directory-alist
#             #   (cons "." "~/.emacs.d/backups/"))
# 	    # (customize-set-variable
# 	    # 'tramp-backup-directory-alist backup-directory-alist)
# 	fi
#     fi
# } 

function check_dir()
{

    echo "Checking several directories under $HOME..."
    echo ""

    a=$1'[@]'
    for i in "${!a}";
    do
    echo "$HOME/$i "

    if [ ! -d $HOME/$i ]
    then
        echo "No $i directory exists"
        exit 1
    fi
    done
}

check_dir dot_dir

#create_dir dot_dir
#apt_get_update
#install "core"
#set_timezone
#install "fish"
#setup_tmux
#nmap
#setup_emacs

