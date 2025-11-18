# Enable colors and change prompt:
autoload -U colors && colors
# PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
PS1="%B%F{132}%~%f%b %% "

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
HISTDUP=erase
setopt appendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Basic auto/tab complete:
eval "$(fzf --zsh)"
eval "$(gdircolors -b)"
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*:git-checkout:*' sort false
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.
bindkey '^Y' autosuggest-accept
bindkey '^N' history-search-forward
bindkey '^P' history-search-backward



# vi mode
bindkey -v
export KEYTIMEOUT=1
# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

#NOTE: This function kinda breaks normal vim, but there is a low chance imma use regular vim anyways LOL
# function zle-keymap-select {
#   if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
#     echo -ne '\e[2 q'   # blinking block
#   elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
#     echo -ne '\e[6 q'   # blinking underline (instead of pulsing beam)
#   fi
# }
# zle -N zle-keymap-select
# zle-line-init() {
#   zle -K viins
#   echo -ne "\e[6 q"   # start with blinking underline
# }
# zle -N zle-line-init
# # Ensure cursor shape resets for new prompts
# preexec() { echo -ne '\e[6 q' ;}
# # Ensure cursor shape resets for new prompts
# preexec() { echo -ne '\e[6 q' ;}


# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char


# bindkey -s '^o' 'lfcd\n'

# change editor and visualizor for n3
export NNN_PLUG="f:fzcd;c:bulknew;y:cbcopy-mac" #access plugins with ;<key>
export NNN_TRASH="trash"
export NNN_FIFO="/tmp/nnn.fifo"
export NNN_USE_EDITOR=1
export VISUAL=nvim
export EDITOR=nvim
export NNN_BMS="h:/Users/joseph;c:/Users/joseph/Coding;D:/Users/joseph/Documents;d:/Users/joseph/Downloads;b:/Users/joseph/Library/CloudStorage/Box-Box;s:/Users/joseph/Documents/UCLA/25-fall/"



# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/joseph/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/joseph/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/joseph/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/joseph/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# =============== ALIASES ===============
alias vim='nvim'
alias tm='tmux'
alias ta='tmux a'
alias tn='tmux new -ds'
alias tm='tmux new -s'
alias G++='g++ -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion -Werror'
alias CLANG++='clang++ -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion -Werror'
alias ls='gls --color=auto'
alias n3='nnn -e -G'
alias emacs='doom emacs'
alias em='doom emacs' 
alias za='zathura'
alias pv='python3 -m venv'

export PATH="/usr/local/opt/openssl/bin:$PATH"
bindkey '^H' backward-kill-word
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

export PATH="$HOME/.config/emacs/bin:$PATH"


export PATH="/opt/homebrew/bin:$PATH"

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source ~/somewhere/fzf-tab.plugin.zsh
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH="$HOME/.local/bin:$PATH"
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/joseph/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
