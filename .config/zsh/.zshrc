#!/bin/zsh

. ~/.config/zsh/zshrc_private

#  aliases{{{

#===============================================================================
#                              Aliases
#===============================================================================

#---------------------------------------
#              MVPS
#---------------------------------------

alias ..="cd .."
alias ...="cd ../.."
alias a='adb connect 192.168.1.104'
alias c="clear"
alias cc="rm ~/.local/share/calcurse/.calcurse.pid; calcurse"
alias cLO="curl -LO"
alias cpr="cp -r"
alias t="git checkout -B test > /dev/null 2>&1"
alias d="doas --"
alias dau="doas -u $USER --"
alias dc="doas cfdisk"
alias dcpr="da cp -r"
alias dfh="df -h"
alias dka="da killall"
alias dlf="da lf"
alias dm="doas mount"
alias dmd="da mkdir"
alias dmv="da mv"
alias drmr="da rm -r"
alias dul="d umount -l"
alias e="exit"
alias f="faint"
alias f3="faint -d 3"
alias f5="faint -d 5"
alias fl="faint -l"
alias fn="faint -n"
alias fr="flutter run"
alias g="bolt -g"
alias gR="grep -R"
alias ka="killall"
alias l="launch -f"
alias m="git checkout master > /dev/null 2>&1"
alias M="neomutt 2>/dev/null"
alias md="mkdir"
alias ml="mpv --loop"
alias n="nvim +'Telescope find_files'"
#  alias n="nvim -c 'cd $(cat ~/.local/share/nvim/LAST_PATH) | Telescope find_files'"
# alias n="XDG_CONFIG_HOME=/mnt/internal/downloads/lua nvim5"
# alias n="nvim5 --clean -S ~/.config/nvim/init.lua"
# alias n="newsboat"
alias off="leavex -s"
alias offon="leavex -r"
alias p="git checkout personal > /dev/null 2>&1"
alias pf="pkill -f"
alias pg="ps aux | grep"
alias psp1="patch -s -p1"
alias rmr="rm -r"
# alias s="bolt --search"
alias sshp="ssh -p \$PORT \$PHONE"
alias tdm="toggle-dark-mode"
alias tfl="tail -f *.log"
# alias src=". ~/.config/zsh/functions && . ~/.config/zsh/aliases"
alias user="who | head -1 | cut -d' ' -f1"
alias v="nvim"
alias W="weechat"
alias x="xprop"
alias xek="xev -event keyboard"
alias xmqf="xdg-mime query filetype"
# alias yda="youtube-dl -x --embed-thumbnail -f bestaudio/best"
alias yda="youtube-dl -x --embed-thumbnail --audio-format mp3"
alias ydv="youtube-dl -f best"
alias tra="transmission-remote -a"

# alias t=": >"
# yd="youtube-dl -x --audio-format mp3 --audio-quality 0"

#---------------------------------------
#              Pacman & Yay
#---------------------------------------

# alias dp="d pacman"
# alias dpS="dp -S"
# alias dpSn="dpS --needed"
# alias dpSnn="dpSn --noconfirm "
# alias dpSyu="dp -Syu"
# alias dpRns="dp -Rns"
# alias dpRnsn="dpRns --noconfirm"

alias pQs="pacman -Qs"
# alias pQqe="pacman -Qqe"

# alias expac="expac | sort -n"

# alias yS="yay -S"
# alias ySn="yS --needed"
# alias ySnn="ySn --noconfirm"


#---------------------------------------
#               Neovim
#---------------------------------------

alias nn="nvim +'cd /mnt/internal/git/daily/notes | Telescope find_files'"
alias nc="nvim +'cd /mnt/internal/git/system/magpie/.config/nvim | Telescope find_files'"
alias nd="nvim +'cd /mnt/internal/git/system/magpie/.config | Telescope find_files'"
alias nz="nvim ~/.config/zsh/.zshrc"
alias nzp="nvim ~/.config/zsh/zshrc_private"
alias nf="nvim ~/.config/faintrc"

#---------------------------------------
#               Paru
#---------------------------------------

alias pS="paru -S"
alias pSyu="paru -Syu"
alias pSyun="pSyu --noconfirm"
alias pSyy="paru -Syy"
alias pSyyn="pSyy --noconfirm"
alias pSyynn="pSyyn --needed"
alias pRns="paru -Rns"
alias pRnsn="pRns --noconfirm"

#---------------------------------------
#              Git
#---------------------------------------

alias gP="git pull"
alias gPr="git pull --rebase"
alias gPn="git pull --no-rebase"
alias gaa="git add -A"
alias gb="git branch"
alias gbm="gb -m"
alias gba="gb -a"
alias gbD="gb -D"
alias gc="git checkout"
alias gcB="gc -B"
alias gcl="git clone"
alias gcan="git commit --amend --no-edit"
alias gd="git diff"
alias gfa="git fetch --all"
alias gi="git init"
alias glo="git log --oneline"
alias glogda="git log --oneline --graph --decorate --all"
alias gm="git merge"
alias gmn="git merge --no-ff"
alias gp="git push"
alias gpdo="git push -d origin"
alias gpf="gp -f"
alias gpfo="gpf origin"
alias gpfom="gp -f origin master"
alias gpfop="gp -f origin personal"
alias gpo="gp origin"
alias gpod="gpo -d"
alias gpom="gpo master"
alias gpuo="gp -u origin"
alias gra="git remote add"
alias grau="gra upstream"
alias grc="git rebase --continue"
alias grh="git reset --hard"
alias grir="git rebase -i --root"
alias grsu="git remote set-url"
alias grsuo="grsu origin"
# alias grsuu="grsu upstream"
alias grsuapo="git remote set-url --add --push origin"
alias gs="git stash"
alias gS="git switch"
alias gsc="git stash clear"
alias gsgsc="git stash && git stash clear"

# alias grH="git reset HEAD"
# alias gpsuo="git push --set-upstream origin"
# ug="cd $DF; git commit -a -m"update\" && git push -u origin master"

#  --------------------------------------------------
#  -                   Python
#  --------------------------------------------------
alias pi="pip install"
alias piU="pip install -U"
alias pfr="pip freeze > requirements.txt"
alias pir="pip install -r requirements.txt"
alias pL="pip list"
alias pm="python -m"
alias pmv="pm virtualenv"

alias pu="pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U 2> /dev/null"
alias pU="pip uninstall"

pI (){
  [ -d env ] || virtualenv env
  source env/bin/activate
  [ -f requirements.txt ] && pip install -r requirements.txt
}

alias pl='source env/bin/activate && nodemon src/main.py'


#---------------------------------------
#              Yarn
#---------------------------------------
alias y="yarn"
alias ya="y add"
alias yaD="ya -D"
alias yb="y build"
alias yc="y create"
alias yd="y dev"
alias yg="y generate"
alias yga="y global add"
alias ygr="y global remove"
alias yi="y init"
alias yiy="yi -y"
alias yl="y list"
alias ys="y start"
alias yt="y test"
alias ysA="ys --android"
alias yr="y remove"
alias yu="y upgrade"
alias yuL="y upgrade --latest"

#---------------------------------------
#              Make
#---------------------------------------
alias dmi="da make install"
alias dmc="da make clean"
alias dmci="da make clean install"
alias dmu="da make uninstall"

#---------------------------------------
#              Systemd
#---------------------------------------
alias dsd="da systemctl disable"
alias dse="da systemctl enable"
alias dsr="da systemctl reload"
alias dsR="da systemctl restart"
alias dss="da systemctl start"
alias dsS="da systemctl stop"
alias dsf="da systemctl --failed"
alias sab="systemd-analyze blame"
alias dj="da journalctl -p 3 -xb"

#---------------------------------------
#              Runit
#---------------------------------------
alias dsu="da sv up"
alias dsd="da sv down"
alias dss="da sv status"

#---------------------------------------
# Misc
#---------------------------------------
alias ls="ls -hN --color=auto --group-directories-first"
alias grep="grep --color=auto"
alias diff="diff --color=auto"

#---------------------------------------
#              Docker 
#---------------------------------------
# alias db="docker build"

# SSH
alias scii="ssh-copy-id -i $GIT/system/magpie-private/.ssh/id_rsa.pub"


#---------------------------------------
#               Exp
#---------------------------------------
alias mvm="sshfs -p 3022 salman@127.0.0.1:/ /mnt/external"
alias mle="sshfs -p 717 root@45.118.133.235:/root /mnt/external"
alias ue="umount /mnt/external"

# #---------------------------------------
# #              Laravel
# #---------------------------------------

# alias ccppdll="composer create-project --prefer-dist laravel/laravel"
# alias cda="composer dump-autoload"

# alias pa="php artisan"
# alias pas="pa serve"

# # Make
# alias pammo="pa make:model"
# alias pammg="pa make:migration"
# alias pammd="pa make:middleware"
# alias pamc="pa make:controller"

# # Migration
# alias pam="pa migrate"
# alias pamf="pa migrate:fresh"
# alias pams="pa migrate:status"
# alias pamr="pa migrate:rollback"


# # tmux
# alias ta="tmux attach || tmux"
# alias tl="tmux ls"

# # XBPS
# alias
#    dxi="da xbps-install"
#    dxis="da xbps-install -S"
#    dxisy="da xbps-install -Sy"
#    dxrry="da xbps-remove -Ry"
#    dxisuy="da xbps-install -Suy"
#    xqrs="xbps-query -Rs"

# # Flutter
# alias fr="flutter run"


# GPG
# alias gpgs="gpg -c --s2k-cipher-algo AES256 --s2k-digest-algo SHA512 --s2k-count 65536"

# # lsd
# alias l="lsd"
# alias ll="lsd -l"
# alias l1="lsd -1"
# alias lA1="lsd -1A"
# alias lAl="lsd -Al"
# alias lt="lsd --tree"
# alias lAt="lsd -A --tree"

# # Power
# alias sS='systemctl suspend'
# alias sH='systemctl hibernate'
# alias pku='pkill -KILL -u $USER'
# alias po='poweroff'
# alias rb='reboot'


# # Adb
# alias aps="adb push --sync"
# alias ai="adb install"

# # NPM
# alias ncra="npx create-react-app"

#---------------------------------------
#              NPM
#---------------------------------------
# alias niy="npm init -y"

# alias ni="npm install"
# alias nis="npm install --save"
# alias niD="npm install -D"
# alias dnig="da npm install -g"

# alias nrd="npm run dev"
# alias nrs="npm run start"
# alias nrt="npm run test"
# alias nrb="npm run build"

# alias nu="ncu -u"


#  ╔════════════════════════════════════════
#  ║                    Fastboot
#  ╚════════════════════════════════════════
alias ffs="fastboot flash system"
alias fr="fastboot reboot"

# }}}
#  functions{{{

#===============================================================================
#                              Functions
#===============================================================================

#---------------------------------------
#               Git
#---------------------------------------

#  griH() {
  #  COMMIT_COUNT=$(git rev-list --count master)
  #  git rebase -i HEAD~$((COMMIT_COUNT - 1))
#  }

merge() {
  git add .
  if [ -z "$1" ]; then
    git commit --amend --no-edit
    # git commit --allow-empty-message -m ''
  else
    git commit -m "$*"
  fi
  git checkout master
  git merge test
  git branch -D test
}

gcg() { git clone git@gist.github.com:"$1".git; }

#---------------------------------------
#               DB
#---------------------------------------

mi() {
  [ -d /run/mysqld ] || doas -n mkdir /run/mysqld
  doas -n chown -R salman /run/mysqld /var/lib/mysql
  mysqld --user=salman
}

post() {

  if [ ! -d /run/postgresql ]; then
    doas -n mkdir -p /run/postgresql
    doas -u $USER chown -R $USER /run/postgresql
  fi

  if [ ! -d /usr/local/var/postgres ]; then
    doas -n mkdir -p /usr/local/var/postgres
    doas -u $USER chown -R $USER /usr/local/var/postgres
  fi

  postgres -D /usr/local/var/postgres
}

#---------------------------------------
#               Misc
#---------------------------------------


launch(){
  program=$1
  shift
  arguments=$*
  setsid $program --force-device-scale-factor=$(get-dpi -f) $arguments > /dev/null 2>&1
}

fe(){
  npx -p node-firestore-import-export firestore-export -a credentials.json -b backup.json
}

#  alias b="setsid brave > /dev/null 2>&1"
b(){ launch brave $*; }
dis(){ launch discord; }
fire(){ launch firefox; }
muse(){ launch musescore; }
q(){ launch qutebrowser; }
s(){ launch spotify; }
z(){ launch zoom; }
vir(){ launch virtualbox; }

# img2webp(){
#   find $PWD -name "*.jpg" -o -name "*.png" \
#     -exec cwebp -o {}.webp -- {} \;
# }

tel() {
  nvim +"cd $1 | Telescope find_files"
}

denim(){ tel /mnt/internal/git/work/denim/src; }
3zc(){ tel /mnt/internal/git/work/3ZC/src; }

oi(){
  mogrify \
    -strip \
    -colorspace RGB \
    -interlace Plane \
    -gaussian-blur 0.05 \
    -quality 50 \
    -path $PWD/optimized/ \
    $PWD/*.jpg
}

A() {
  adb kill-server
  daas adb start-server
}

packages() { expac '%m %n' | sort -n; }
h2p() { wkhtmltopdf --enable-local-file-access "$1" "${1%.*}.pdf"; }
gesr() { gpg -esr "$MAIL_BOX" "$1" && rm "$1"; }
# compress() { tar cvzf "compressed.tar" "$@"; }
tcf() { tar cf "$1".tar "$1"; }

h() {
  tail -25 ~/.config/zsh/history |
    sed -e 's/.*;//' \
      -e '1i#!/bin/sh' |
      nvim
}

N() {
  pidof mpd > /dev/null || mpd 2> /dev/null
  ncmpcpp
}

vpn() { doas -- openvpn --config ~/.local/share/misc/vpnbook-us1-tcp80.ovpn; }
flg() { fc-list | grep -i "$1"; }
ug() { doas -n -- grub-mkconfig -o /boot/grub/grub.cfg; }
dbt() {
   docker build -t "$1" "$PWD"
}
view() {
  setsid -f qutebrowser \
    localhost:"$1" > /dev/null 2>&1
   # http://192.168.0.100:"$1" > /dev/null 2>&1
}
graph() {
  setsid -f surf \
    localhost:8022/graphql > /dev/null 2>&1
}
pdf2png() { pdftoppm -png "$1" > converted.png; }
u(){ sort "$@" | uniq -u }

dy(){
  cd /mnt/internal/git/work/yy_ventures/
  yarn generate
  cd /mnt/internal/git/work/yy_ventures/dist
  zip -r dist.zip *
  mv /mnt/internal/git/work/yy_ventures/dist/dist.zip /mnt/internal/downloads
}

#  skp(){
  #  ssh-keygen -t rsa -q -b 4096 -f /tmp/key -N '' && cat /tmp/key | xsel -b
#  }

#---------------------------------------
#               Exp
#---------------------------------------

list() {
  pacman -Qi |
    awk '/^Name/{name=$3} /^Installed Size/{print $4$5, name}' |
    sort -hr |
    head -25
}

dnmr() {
  #  find . -name 'node_modules' -type d -prune -exec rm -rf '{}' +
  find . -name 'node_modules' -type d -prune -print -exec rm -rf '{}' \;
}

sk(){
  LOCATION=$PWD
  cd /tmp
  rm key key.pub
  #  ssh-keygen -t rsa -f key -q -N '' && cat key | xsel -b
  ssh-keygen -t rsa -f key -q -N '' && cat key.pub | xsel -b
  #  ssh-copy-id -i key.pub "$1"
  cd $LOCATION
}

share(){
  curl --upload-file "$1" https://transfer.sh
}

# ntfs(){
#   lsblk
#   echo "Partition Letter and Digit"
#   read -r PART
#   doas -n -- mkntfs --fast --label thumbdrive /dev/sd$PART
# }

# H() {
#    out=$($1 --help || $1 -h)
#    echo "$out" | nvim -R
# }
# h() { "$1" --help | nvim -R; }

# fp() {
#    read -r FILE_LIST < /tmp/FAINT_FILE_LIST
#    cp -br $FILE_LIST .
# }

# rs() { doas -n ln -s /etc/runit/sv/"$1" /run/runit/service; }
# rS() { doas -n rm /run/runit/service/"$1"; }

# disableMinNCam() {
#    [ "$1" ] && echo "" | doas tee /etc/modprobe.d/blacklist.conf && return
#    echo install uvcvideo /bin/true | doas -- tee -a /etc/modprobe.d/blacklist.conf > /dev/null
#    echo install "$(sed 1q /proc/asound/modules | cut -d ' ' -f 3)" /bin/true | doas -- tee -a /etc/modprobe.d/blacklist.conf > /dev/null
# }

# gsa() { git subtree add --prefix "$1" "$2" master --squash; }
# gsp() { git subtree pull --prefix "$1" "$2" master --squash; }

# check() {
#    time sh -c 'for i in $(seq 1000); do toy > /dev/null 2>&1; done'
#    # time sh -c 'for i in $(seq 1000000); do $@ > /dev/null; done'
# }

# calc() { echo "$*" | bc; }

# cuT() {
#    curl \
#       -u "$MAIL:$(gpg -d ~/.local/share/passwords/salmanabedin@disroot.org.gpg)" \
#       https://cloud.disroot.org/remote.php/dav/files/salmanabedin/ -T "$1"
# }

# twr() {
#    iwctl station wlan0 disconnect
#    iwctl station wlan0 scan
#    # sleep 2
#    iwctl --passphrase pS73exd1 station wlan0 connect DIRECT-f6-Android_b199
#    iwctl --passphrase pqlamz., station wlan0 connect c4rn@g3
#    iwctl station wlan0 show
#    return
#    return
#    if iwctl station wlan0 show | grep -i "direct"; then
#       iwctl --passphrase pqlamz., station wlan0 connect c4rn@g3
#       notify-send -u low -i "$ICONS"/connected.png 'Connected to default'
#    else
#       iwctl --passphrase pS73exd1 station wlan0 connect DIRECT-f6-Android_b199
#       notify-send -u low -i "$ICONS"/connected.png 'Connected to repeater'
#    fi
# }

# ttz() {
#    if readlink /etc/localtime | grep Berlin > /dev/null; then
#       doas -- ln -sf /usr/share/zoneinfo/Asia/Dhaka /etc/localtime
#    else
#       doas -- ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
#    fi
# }

# short() { curl -F "shorten=$1" 0x0.st; }

# autologin() {
#    path=/etc/systemd/system/getty@tty1.service.d/override.conf
#    [ "$1" ] && echo '' | doas tee $path && return
#    printf "%s" "[Service]\nExecStart=\nExecStart=-/usr/bin/agetty --autologin $USER --noclear %I $TERM" | doas tee $path
# }

# server() {
#    [ "$1" ] && echo 'Server = http://mirror.xeonbd.com/archlinux/$repo/os/$arch' |
#       doas tee /etc/pacman.d/mirrorlist && return
#    doas -- reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
# }

# god() { gpg -o "${1%.gpg}" -d "$1"; }
# }}}
# config{{{

#===============================================================================
#                              Config
#===============================================================================

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

# Git
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '🌴 %b '
precmd () { vcs_info }
PS1+="%{$fg[yellow]%}"
PS1+=\$vcs_info_msg_0_

# Path
# PS1+="📁 %{$fg[blue]%}%1~ "
PS1+="📁 %{$fg[blue]%}%~ "

# # Machine
# PS1+="😎 %{$fg[green]%}%n "
# PS1+="💻 %{$fg[red]%}%m "

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
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
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
#  [ -f /usr/share/fzf/key-bindings.zsh ] && . /usr/share/fzf/key-bindings.zsh
#  [ -f /usr/share/fzf/completion.zsh ] && . /usr/share/fzf/completion.zsh
#  . /mnt/internal/git/upstream/fzf-tab/fzf-tab.plugin.zsh 2>/dev/null

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=59'

. /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

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
# }}}

alias luamake=/mnt/internal/git/upstream/lua-language-server/3rd/luamake/luamake
