# mykali 

## Description

mykali is an ansible-based automation that deploys customized tools and features to a default Kali environment. This is basically designed push your specific tools and configurations when introducing a new Kali OS to a pentesting or CTF engagement. Check a relevant blog [Ansible based automation for a new Kali](https://iptracej.github.io/posts/2023-09-22-my-kali-ansible-automation/). 

## Instruction

- Use a new Kali machine. You can download it from [here](https://www.kali.org/get-kali/#kali-platforms). 
- Install ansible
- Clone this repo
- Run ansible-playbook to auto-configure the environment

## Current stage

Version 0.1 - Complete alpha stage. I have only tested a VMWare Kali image with 2023-3 release. 

## Warning
This script will replace some of your important files such as .bashrc, .bash-aliases, .tmux.conf, and init.el. Ensure that these changes will not impact to your environment. Review these files under roles and files directory and adjust them accordingly. 

This is still an alpha stage. Use it with your own risk. Use it for a new machine. I would not use this when you have already started using the kali.  

## Installation

```bash
# update all at the beginning
sudo apt update 

# install pip3 
sudo apt install python3-pip  

# install ansible
pip3 install ansible 

# install mykali
git clone https://github.com/iptracej/mykali
cd mykali
ansible-playbook main.yml --ask-become-pass # supply your sudo password
```

## Todo

- Burpsuite and Browser extensions
- Fish shell and their plugins integration 

## Note and special thanks

I have used ippsec 'parrot build' repo and reuse some of the scripts. [https://github.com/IppSec/parrot-build](https://github.com/IppSec/parrot-build). 


