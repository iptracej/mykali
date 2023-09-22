# Common aliaes

#alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

alias l='ls -la'
alias rm='rm -i'
alias mv='mv -i'

alias refresh='source $HOME/.bashrc'
alias refresh_fish='source $HOME/.config/fish/config.fish'

# fish specific aliaes

alias screenshot_stop_fish='sed -i "s/^.*flameshot/  ##flameshot/g" $HOME/.config/fish/config.fish && source $HOME/.config/fish/config.fish'
alias screenshot_start_fish='sed -i "		s/^.*##flameshot/  flameshot/g" $HOME/.config/fish/config.fish && source $HOME/.config/fish/config.fish'

# pentesting specific aliaes

alias opt_update='cd /opt; find . -name ".git" -type d | sed "s/\/.git//" | xargs -t -P10 -I{} git -C {} pull'
alias msf='sudo systemctl start postgresql && sudo msfconsole -q'
alias b='sudo env -i beep -l 25 -r 1' 
alias bb='sudo env -i beep -l 50 -r 2'

# lab specific aliaes

alias oscpvpn='sudo openvpn /home/iptracej/oscp/OS-66282-PWK.ovpn'
alias htbvpn='sudo openvpn /home/iptracej/htb/lab_iptracej.ovpn'
alias pgvpn='sudo openvpn /home/iptracej/pg/pg.ovpn'
alias win10='rdesktop -g90% -u offsec -p lab 192.168.128.10'
alias win10d='rdesktop -g90% -d corp -u offsec -p lab 192.168.128.10'
alias win10a='rdesktop -g90% -u administrator -p lab 192.168.128.10'
alias win10ad='rdesktop -g90% -d corp -u administrator -p lab 192.168.128.10'
alias deb='rdesktop -u root -p lab 192.168.128.44'

# Modern cat - bat

alias bat='bat --style plain --theme base16-256 -n'

# rustscan
alias rustscan='sudo docker run -it --rm --name rustscan rustscan/rustscan:1.10.0'

# python tools

alias pypykatz='/opt/python/pypykatz/venv/bin/pypykatz'
alias kerberoast='/opt/python/kerberoast/venv/bin/kerberoast'
alias certipy='/opt/python/Certipy/venv/bin/certipy'

