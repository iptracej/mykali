# mykali 

## Description

mykali is an automation script to deploy my customized tools and features to a default Kali environment. This is basically designed when introducing a new Kali OS to be deployed to a new pentesting or CTF engagement. 

## Instruction

- Use a new Kali machine. You can download it from [here](https://www.kali.org/get-kali/#kali-platforms). 
- Install ansible
- Clone this repo
- Run ansible-playbook to auto-configure the environment

## Current stage

Version 0.1 - Complete alpha stage. I have tested a VMWare Kali image with 2023-3 release. 

## Warning
This script will replace some important files such as .bashrc, .bash-aliases, .tmux.conf, and init.el. Ensure that these changes will not impact to your environment. Review these files under roles and files directory and adjust them accordingly. 

This is still an alpha stage. Use it with your own risk. I would not use this when you have already started using the kali.  

## Installation

```bash
# install ansible
pip3 install ansible 

# install mykali
git clone 
cd mykali
ansible-playbook main.yml --ask-become-pass # supply your sudo password
```
## Note and special thanks

I have used ippsec 'parrot build' repo and reuse some of the scripts. [https://github.com/IppSec/parrot-build](https://github.com/IppSec/parrot-build). 


