#! /bin/bash
# individual user work

# [Tmux]
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# And I should run `tmux source ~/.tmux.conf` in tmux
# <prefix> + I to install plugin

# [Vim]
# +: -c 
# Since the installer on Vim 8 is asynchronous, you might want to pass --sync flag
vim +'PlugInstall --sync' +qa

# [Other]
git clone https://github.com/radare/radare2.git
./radare2/sys/install.sh
