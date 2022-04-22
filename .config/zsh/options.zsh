#!/usr/bin/env zsh

setopt promptsubst

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

autoload -U colors
colors

#---------------------------------------
#               Prompt
#---------------------------------------

PS1=""
PS1+="%B"

# User & Machine
PS1+="👤 %{$fg[yellow]%}%n "
PS1+="💻 %{$fg[red]%}%m "

# Git
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '🌴 %b '
precmd () { vcs_info }
PS1+="%{$fg[green]%}"
PS1+=\$vcs_info_msg_0_

# Path
# PS1+="📁 %{$fg[blue]%}%1~ "
PS1+="📁 %{$fg[grey]%}%~ "


# Shell
PS1+=$'\n'
[ "$EUID" = 0 ] &&
   PS1+="🔨 " ||
   PS1+="💲 "

# Reset
PS1+="%{$reset_color%}%b"

#---------------------------------------
#               Completion
#---------------------------------------

fpath=($HOME/.config/zsh/completions $fpath)

## Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zmodload zsh/complist
# compinit
compinit -u
_comp_options+=(globdots)		# Include hidden files.
setopt COMPLETE_ALIASES         # Alias auto completions
# zstyle ':completion::complete:*' gain-privileges 1


# Make completion:
# - Case-insensitive.
# - Accept abbreviations after . or _ or - (ie. f.b -> foo.bar).
# - Substring complete (ie. bar -> foobar).
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Colorize completions using default `ls` colors.
zstyle ':completion:*' list-colors ''

#---------------------------------------
#               Options
#---------------------------------------

setopt autocd               # no cd required
setopt autoparamslash       # tab completing directory appends a slash
setopt autopushd            # cd automatically pushes old dir onto dir stack
setopt clobber              # allow clobbering with >, no need to use >!
# setopt correct              # command auto-correction
# setopt correctall           # argument auto-correction
setopt noflowcontrol        # disable start (C-s) and stop (C-q) characters
setopt nonomatch            # unmatched patterns are left unchanged
setopt histignorealldups    # filter duplicates from history
setopt histignorespace      # don't record commands starting with a space
setopt histverify           # confirm history expansion (!$, !!, !foo)
setopt ignoreeof            # prevent accidental C-d from exiting shell
setopt interactivecomments  # allow comments, even in interactive shells
# setopt printexitvalue       # for non-zero exit status
setopt pushdignoredups      # don't push multiple copies of same dir onto stack
setopt pushdsilent          # don't print dir stack after pushing/popping
setopt sharehistory         # share history across shells

#---------------------------------------
#               Misc
#---------------------------------------

## History in cache directory:
HISTSIZE=10000
SAVEHIST=$HISTSIZE
HISTFILE=~/.config/zsh/history


## Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    #  echo -ne '\e[1 q'
    echo -ne "\ePtmux;\e\e\e[1 q\e\\"

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    #  echo -ne '\e[5 q'
    echo -ne "\ePtmux;\e\e\e[5 q\e\\"
  fi
}
zle -N zle-keymap-select

zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init

## Use beam shape cursor on startup.
echo -ne '\e[5 q'
## Use beam shape cursor for each new prompt.
preexec() { echo -ne '\e[5 q' ;}

#---------------------------------------
#               Bindings
#---------------------------------------

## vi mode
bindkey -v
export KEYTIMEOUT=1

## Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

bindkey -M vicmd '\e' fzf-history-widget

# bindkey -M vicmd 'j' vi-backward-char
# bindkey -M vicmd ';' vi-forward-char
# bindkey -M vicmd 'J' vi-backward-word
# bindkey -M vicmd ':' vi-forward-word
# bindkey -M vicmd 'k' vi-up-line-or-history
# bindkey -M vicmd 'l' vi-down-line-or-history

# bindkey     "^[j"   backward-char
# bindkey     "^[k"   up-line-or-history
# bindkey     "^[l"   down-line-or-history
# bindkey     "^[;"   forward-char
# bindkey     "^[h"   beginning-of-line
# bindkey     "^['"   end-of-line
# bindkey     "^[o"   backward-delete-char
# bindkey     "^[i"   delete-char

## create a zkbd compatible hash;
## to add other keys to this hash, see: man 5 terminfo
# typeset -g -A key

# key[Home]="${terminfo[khome]}"
# key[End]="${terminfo[kend]}"
# key[Insert]="${terminfo[kich1]}"
# key[Backspace]="${terminfo[kbs]}"
# key[Delete]="${terminfo[kdch1]}"
# key[Up]="${terminfo[kcuu1]}"
# key[Down]="${terminfo[kcud1]}"
# key[Left]="${terminfo[kcub1]}"
# key[Right]="${terminfo[kcuf1]}"
# key[PageUp]="${terminfo[kpp]}"
# key[PageDown]="${terminfo[knp]}"
# key[ShiftTab]="${terminfo[kcbt]}"

# ## setup key accordingly
# [[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"      beginning-of-line
# [[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"       end-of-line
# [[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"    overwrite-mode
# [[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}" backward-delete-char
# [[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"    delete-char
# [[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"        up-line-or-history
# [[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"      down-line-or-history
# [[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"      backward-char
# [[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"     forward-char
# [[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"    beginning-of-buffer-or-history
# [[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"  end-of-buffer-or-history
# [[ -n "${key[ShiftTab]}"  ]] && bindkey -- "${key[ShiftTab]}"  reverse-menu-complete

# ## Finally, make sure the terminal is in application mode, when zle is
# ## active. Only then are the values from $terminfo valid.
# if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
# 	autoload -Uz add-zle-hook-widget
# 	function zle_application_mode_start { echoti smkx }
# 	function zle_application_mode_stop { echoti rmkx }
# 	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
# 	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
# fi

# autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
# zle -N up-line-or-beginning-search
# zle -N down-line-or-beginning-search

# [[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
# [[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search


#---------------------------------------
#               Sources
#---------------------------------------

# GIT_COMPLETION=/usr/share/git/completion/git-completion.zsh
# [ -f $GIT_COMPLETION ]  && . $GIT_COMPLETION
# PS1+='$(__git_ps1 "%s")'

#  # fzf
#  . /mnt/internal/git/upstream/fzf-tab/fzf-tab.plugin.zsh 2>/dev/null

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=59'


# powerleve10k
# [ -f /home/git/others/zsh_powerlevel10k/powerlevel10k.zsh-theme ] &&
#    . /home/git/others/zsh_powerlevel10k/powerlevel10k.zsh-theme

# # To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
# [[ ! -f ~/.config/zsh/.p10k.zsh ]] || . ~/.config/zsh/.p10k.zsh


#---------------------------------------
#               Exp
#---------------------------------------

# PS1=$'${(r:$COLUMNS::_:)}\n\n'$PS1
# PS1=$'%U${(r:$COLUMNS:: :)}%u\n\n'$PS1

# PS1+="%{$fg[red]%}%(1j.*.)"
# PS1+="%{$fg[yellow]%}%(?..!)"
# PS1+="%{$reset_color%}%b"

# [ "$EUID" = 0 ] &&
#    PS1+="%{$fg[red]%}%1~ " ||
#    PS1+="%{$fg[blue]%}%1~ "

# [ "$EUID" = 0 ] &&
#    PS1+="   " ||
#    PS1+="💲 "

# [[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh


# [ "$TMUX" ] || tmux attach || exec tmux

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi
