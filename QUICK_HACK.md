# mykali - Quick Hack  

This is the instruction to configure some of the files to pre-complied desktop like 'Pwnbox' on the hack the box. 

Warning: I use a fish shell (Not bash or zsh) for shell environment. 
If you do not like it, please change the default shell to your shell in .tmux.conf. Also, check all other tmux configurations and see if you want to customize it. 

## Set-up Instruction

1) Download the mykali github content to the local directory.  

```bash
cd ~
git clone https://github.com/iptracej/mykali/ 
```

2) Install fish and bass plugin.
```bash
sudo apt install fish

# fisher - fish plugin manager
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

# bass - bash for fish 
fisher install edc/bass
```

3) Install tmux.
```bash
# Run tmux
tmux        # and exit 

# If not there, install it.
sudo apt install tmux
```

3) Copy configuration files to the directories 
```bash
# backup .tmux conf if any
cp .tmux.conf .tmux.conf.bak

cd mykali 
cp roles/configure-tmux/files/.tmux.conf ~/
cp roles/configure-tmux/files/tmux-* ~/.tmux/

# cp .bashrc .bashrc.bak
# cp roles/configure-kali_env/files/.bashrc ~/
# cp roles/configure-kali_env/files/.bash_aliases ~/
```

4) Install tmux plugins and Fire up tmux
```bash
# Tmux Plugin Manager (TPM)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Run tmux again
tmux 
```
<i> During the tmux session, press prefix(Ctrl+Q) + I (capital i, as in Install) to fetch the plugin if required. </i>


5) Setup mykali bin directory to your path
```bash 
# In fish shell
set -x PATH $PATH:/home/iptracej/mykali/mytools/ 

# Bash
export PATH=$PATH:/home/iptracej/mykali/mytools/ 
```

Now ou are ready to use mykali tmux enviornment. 

## Regular tasks 
```bash
# Run the shell to update the file before git commit and push. This script automates all local dumb tasks. 
./update_local.sh 
```