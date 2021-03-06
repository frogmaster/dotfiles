# Path to your oh-my-zsh configuration.
ZSH=$HOME/.homesick/repos/oh-my-zsh

#for some reason newer zsh has prompt command and on my machine it doesn't play well with themes
#if (( $+commands[prompt] )) ; then 
prompt off 2>/dev/null
#fi
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"
#SH_THEME="blinks"
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git archlinux coffee colored-man colorize command-not-found ssh-agent tmux systemd extract)

setopt no_auto_remove_slash
source $ZSH/oh-my-zsh.sh
source $HOME/.homesick/repos/homeshick/homeshick.sh
#disable the fcking bugger cding me into /usr/src
unsetopt cdablevars

# Customize to your needs...
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/core_perl:/usr/bin/site_perl:/opt/android-sdk/platform-tools:/opt/android-sdk/tools:/usr/bin/vendor_perl
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
export JAVA_FONTS=/usr/share/fonts/TTF
alias ys='ssh -t -t ybershell'
alias ta='tmux attach'
alias penv='. ~/work/py3e/bin/activate'
alias nmup='nmcli con up id'
alias nmdown='nmcli con down id'
alias haldus='sudo yubiswitch on; nmup haldus; sudo yubiswitch off'
fixssh() {
    for key in SSH_AUTH_SOCK SSH_CONNECTION SSH_CLIENT; do
        if (tmux show-environment | grep "^${key}" > /dev/null); then
            value=`tmux show-environment | grep "^${key}" | sed -e "s/^[A-Z_]*=//"`
            export ${key}="${value}"
        fi
    done
}

if test $TMUX
then
    fixssh
fi

if [ -f "$HOME/.dircolors" ] ; then
    eval $(dircolors -b $HOME/.dircolors)
fi

