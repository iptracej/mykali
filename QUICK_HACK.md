# mykali 

This is the instruction to configure some of the files to pre-complied desktop like 'Play Machine' in the hack the box. 

## Set-up Instruction

1) Download the mykali content to the local drive.  

```bash
git clone https://github.com/iptracej/mykali/ 
```

2) Install tmux
```bash
# Maybe tmux is already installed... 
sudo apt install tmux

# Tmux Plugin Manager (TPM)
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Initialize TPM
run '~/.tmux/plugins/tpm/tpm'

# Reload tmux environment so TPM is sourced. 
tmux source ~/.tmux.conf
```
Press prefix + I (capital i, as in Install) to fetch the plugin if required. 

3) Install fish and bass plugin 
```bash
sudo apt install fish

# fisher - fish plugin manager
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

# bass - bash for fish 
fisher install edc/bass
```

4) Copy configuration files to the directories 
```bash
cd mykali 
cp roles/configure-tmux/files/.tmux.conf ~/
cp roles/configure-tmux/files/tmux-* ~/.tmux/
cp roles/configure-kali_env/files/.bashrc ~/
cp roles/configure-kali_env/files/.bash_aliases ~/
```

5) Setup a mykali bin directory to your path
```
export PATH=$PATH:$(pwd)/bin
```

6) Fire up tmux and fish
```bash
# Look at the .tmux.conf and change the default shell to fish. 
# vi .tmux.conf

tmux
```

## Regular tasks 
```bash
# Run the shell to update the file before git commit and push. This script automates all local dumb tasks. 
./update_local.sh 
```