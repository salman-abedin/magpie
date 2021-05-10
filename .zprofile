#!/bin/sh
#
# Environemnt script

# sources{{{
#===============================================================================
#                              Sources
#===============================================================================
[ -L ~/.private ] && . ~/.private
# }}}
# paths{{{
#===============================================================================
#                              Paths
#===============================================================================
export PATH=$PATH:~/.local/bin                      # local scripts
export PATH=$PATH:~/.yarn/bin                       # global node packages
export PATH=$PATH:~/.local/share/gem/ruby/2.7.0/bin # global ruby modules
# }}}
# default programs{{{
#===============================================================================
#                             Defaults Programs
#===============================================================================

export WM="launch --dwm"
export TERMINAL=st
export DMENU=dmenu
# export DMENU=amenu
export STATUSBAR="uniblocks -g"

export EDITOR=nvim
export VISUAL=$EDITOR
export BROWSER=brave
export FILE=faint
export READER=zathura
export COMPOSITOR=xcompmgr

# export MANPAGER="$EDITOR +Man!"
# export PAGER="$EDITOR -R"

# }}}
# system stuff{{{
#===============================================================================
#                             System Stuff
#===============================================================================

export REPOS=/mnt/internal/git/system
export ICONS=~/.local/share/icons/system
export QT_QPA_PLATFORMTHEME="gtk2"
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_SCALE_FACTOR=1
export GROFF_FONT_PATH=~/.local/share/fonts/Groff
export TZ="Asia/Dhaka"

export FZF_DEFAULT_OPTS="\
   --cycle
   --reverse --border bottom --no-info --no-color --header '' --margin 0%,0%
   --bind \;:accept
   --bind esc:cancel
   --bind tab:down
   --bind btab:up
   "
   # --bind \':jump-accept,esc:cancel

export LAYOUT_EN=~/.config/X11/xmodmap-en
export LAYOUT_AR=~/.config/X11/xmodmap-ar
export LAYOUT_BN=~/.config/X11/xmodmap-bn

export GPG_MAIL=salmanabedin@disroot.org
# }}}
# housekeeping{{{
#===============================================================================
#                             Housekeeping
#===============================================================================

export XDG_CACHE_HOME=~/.local/share/cache
export XINITRC=~/.config/X11/xinitrc
export ZDOTDIR=~/.config/zsh
export GOPATH=~/.local/share/go
export HISTFILE=~/.local/share/history
export UNISON=~/.local/share/unison
export WGETRC=~/.config/wget/wgetrc
export XAUTHORITY=~/.config/X11/Xauthority
export STARDICT_DATA_DIR=~/.local/share
export WEECHAT_HOME=~/.config/weechat

export ANDROID_SDK_HOME=~/.config/android
export ADB_VENDOR_KEY=~/.config/android
export ANDROID_AVD_HOME=~/.local/share/android/
export ANDROID_EMULATOR_HOME=~/.local/share/android/

#---------------------------------------
#               Exp
#---------------------------------------
export MOZ_USE_XINPUT2="1" # Smooth Scrolling

export LESS=-R

# export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
# export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
# export LESS_TERMCAP_me="$(printf '%b' '[0m')"
# export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
# export LESS_TERMCAP_se="$(printf '%b' '[0m')"
# export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
# export LESS_TERMCAP_ue="$(printf '%b' '[0m')"
# export LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null"

# }}}
# autostart{{{
#===============================================================================
#                         Auto Start X on TTY1
#===============================================================================

[ "$(fgconsole 2> /dev/null)" = 1 ] &&
   exec startx ~/.config/X11/xinitrc -- vt1 > /dev/null 2>&1
# }}}
# escape swap{{{
#===============================================================================
#                        Swap Escape & Caps Lock when on TTY
#===============================================================================

# doas -n loadkeys ~/.local/share/misc/tty_maps.kmap
# }}}
# experiments{{{
#===============================================================================
#                             Exp
#===============================================================================

# export XDG_OPEN=launch
# export PASSWORD_STORE_DIR=~/.config/pass
# export NODE_ID=/tmp/node_id

# cat /etc/*-release | grep \"void\" >/dev/null && export TERMINAL=alacritty

# export NPM_CONFIG_PREFIX=~/.local/share/npm
#export VIMINIT="if !has('nvim') | source $XDG_CONFIG_HOME/vim/vimrc | endif"
# export GNUPGHOME=~/.local/share/gnupg

# export XDG_CONFIG_HOME=~/.config
# export XDG_DATA_HOME=~/.local/share
# export INPUTRC=~/.config/inputrc
# PATH="$PATH:$(du "$GIT"/own/alfred | cut -f2 | paste -sd ':')"
# PATH="$PATH:$(du $GIT/own/alfred | cut -f2 | tr '\n' ':' | sed 's/:$//')"

# export WM="bspwm"
# export TERMINAL="alacritty"
# export STATUSBAR="yabar"
# export DMENU="rofi -dmenu -i"
# export NPM_CONFIG_USERCONFIG=~/.config/npm/npmrc

# # disable firefox telemetry
# export MOZ_DATA_REPORTING=0
# export MOZ_TELEMETRY_REPORTING=0
# export MOZ_CRASHREPORTER=0
# export MOZ_SERVICES_HEALTHREPORT=0
# [ -L ~/.config/lf/lf_icons ] && . ~/.config/lf/lf_icons
# export PERL5LIB=~/perl5/lib/perl5
# }}}
