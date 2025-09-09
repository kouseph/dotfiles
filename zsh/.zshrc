# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

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
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':fzf-tab:*' fzf-command fzf
zstyle ':fzf-tab:*' fzf-flags --preview-window=right:50%
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color=always $realpath'
zstyle ':completion:*' menu no
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



lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'




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
alias python='python3'
alias vim='nvim'
alias tm='tmux'
alias G++='g++ -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion -Werror'
alias CLANG++='clang++ -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion -Werror'
alias ls='gls --color=auto'

export PATH="/usr/local/opt/openssl/bin:$PATH"
bindkey '^H' backward-kill-word
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word




source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh >> ${ZDOTDIR:-$HOME}/.zshrc
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/somewhere/fzf-tab.plugin.zsh
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
