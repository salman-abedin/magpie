#!/usr/bin/env zsh


alias ..="cd .."
alias ...="cd ../.."
alias c="clear"
alias cc="rm ~/.local/share/calcurse/.calcurse.pid; calcurse"
alias cLO="curl -LO"
alias cpr="cp -r"
alias d="doas -- "
alias dau="doas -u $USER -- "
alias dcpr="da cp -r"
alias dfh="df -h"
alias diff="diff --color=auto"
alias dka="da killall"
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
alias ffs="fastboot flash system"
alias fn="faint -n"
alias fr="fastboot reboot"
alias g="grep --color=auto"
alias gR="grep -R"
alias ka="killall"
alias l="ls -hN --color=auto --group-directories-first"
alias ll="l -l"
alias lla="ll -a"
alias llt="ll -t"
alias lltr="llt -r"
alias m="git checkout master > /dev/null 2>&1"
alias mvm="sshfs -p 3022 salman@127.0.0.1:/ /mnt/external"
alias M="neomutt 2>/dev/null"
alias md="mkdir"
alias ml="mpv --loop"
alias off="leavex -s"
alias offon="leavex -r"
alias pf="pkill -f"
alias pg="ps aux | grep"
alias rr="rm -r"
alias raP="rsync -aP"
alias t="TERM=tmux-256color tmux -u attach || TERM=tmux-256color tmux -u"
alias to=": >"
alias v="nvim"
alias x="xprop"
alias xek="xev -event keyboard"
alias yda="youtube-dl -x --embed-thumbnail --audio-format mp3"
alias ydv="youtube-dl -f best"
alias tra="transmission-remote -a"

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
alias n="nvim +'Telescope find_files'"
alias nn="nvim +'cd /mnt/internal/git/daily/notes | Telescope find_files'"
alias nc="nvim +'cd /mnt/internal/git/system/magpie/.config/nvim | Telescope find_files'"
alias nm="nvim +'cd /mnt/internal/git/system/magpie/.config | Telescope find_files'"
alias np="nvim +'cd /mnt/internal/git/system/magpie-private/.config | Telescope find_files'"

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

alias gb="git branch"
alias gP="git pull"
alias gPr="git pull --rebase"
alias gPn="git pull --no-rebase"
alias gaa="git add -A"
alias gb="git branch"
alias gbm="gb -m"
alias gba="gb -a"
alias gbD="gb -D"
alias gc="git checkout"
alias gct="git checkout -t"
alias gc="git checkout"
alias gcB="gc -B"
alias gcl="git clone"
alias gcT="git checkout -B test > /dev/null 2>&1"
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

alias pl='source env/bin/activate && nodemon src/main.py'


#  #---------------------------------------
#  #              Yarn
#  #---------------------------------------
#  alias y="yarn"
#  alias ya="y add"
#  alias yaD="ya -D"
#  alias yb="y build"
#  alias yc="y create"
#  alias yd="y dev"
#  alias yg="y generate"
#  alias yga="y global add"
#  alias ygr="y global remove"
#  alias yi="y init"
#  alias yiy="yi -y"
#  alias yl="y list"
#  alias ys="y start"
#  alias yt="y test"
#  alias ysA="ys --android"
#  alias yr="y remove"
#  alias yu="y upgrade"
#  alias yuL="y upgrade --latest"

#---------------------------------------
#              Make
#---------------------------------------
alias dmi="da make install"
alias dmc="da make clean"
alias dmci="da make clean install"
alias dmu="da make uninstall"

#---------------------------------------
#              Runit
#---------------------------------------
alias dsu="da sv up"
alias dsd="da sv down"
alias dss="da sv status"

#---------------------------------------
#              Docker 
#---------------------------------------
# alias db="docker build"

#  ╔══════════════════════════════════════════════════════════════════════
#  ║                              Graveyard
#  ╚══════════════════════════════════════════════════════════════════════
#  alias a='adb connect 192.168.1.104'
#  alias dc="doas cfdisk"
#  alias dlf="da lf"
#  alias fr="flutter run"
#  alias p="git checkout personal > /dev/null 2>&1"
#  alias g="bolt -g"
#  alias l="launch -f"
# alias s="bolt --search"
# alias src=". ~/.config/zsh/functions && . ~/.config/zsh/aliases"
# alias yda="youtube-dl -x --embed-thumbnail -f bestaudio/best"
#  alias tdm="toggle-dark-mode"
#  alias tfl="tail -f *.log"
#  alias user="who | head -1 | cut -d' ' -f1"
#  alias xmqf="xdg-mime query filetype"
#  yd="youtube-dl -x --audio-format mp3 --audio-quality 0"
#  alias W="weechat"
#  alias psp1="patch -s -p1"
#  alias sshp="ssh -p \$PORT \$PHONE"
#  alias scii="ssh-copy-id -i $GIT/system/magpie-private/.ssh/id_rsa.pub"


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

# # Adb
# alias aps="adb push --sync"
# alias ai="adb install"

# # NPM
# alias ncra="npx create-react-app"

# GPG
# alias gpgs="gpg -c --s2k-cipher-algo AES256 --s2k-digest-algo SHA512 --s2k-count 65536"

# # Power
# alias sS='systemctl suspend'
# alias sH='systemctl hibernate'
# alias pku='pkill -KILL -u $USER'
# alias po='poweroff'
# alias rb='reboot'

# # lsd
# alias l="lsd"
# alias ll="lsd -l"
# alias l1="lsd -1"
# alias lA1="lsd -1A"
# alias lAl="lsd -Al"
# alias lt="lsd --tree"
# alias lAt="lsd -A --tree"

# # Flutter
# alias fr="flutter run"

# # XBPS
# alias
#    dxi="da xbps-install"
#    dxis="da xbps-install -S"
#    dxisy="da xbps-install -Sy"
#    dxrry="da xbps-remove -Ry"
#    dxisuy="da xbps-install -Suy"
#    xqrs="xbps-query -Rs"

#  alias tl="tmux ls"

#  alias luamake=/mnt/internal/git/upstream/lua-language-server/3rd/luamake/luamake
# alias nu="ncu -u"

#  #---------------------------------------
#  #              Systemd
#  #---------------------------------------
#  alias dsd="da systemctl disable"
#  alias dse="da systemctl enable"
#  alias dsr="da systemctl reload"
#  alias dsR="da systemctl restart"
#  alias dss="da systemctl start"
#  alias dsS="da systemctl stop"
#  alias dsf="da systemctl --failed"
#  alias sab="systemd-analyze blame"
#  alias dj="da journalctl -p 3 -xb"

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

#  alias n="nvim -c 'cd $(cat ~/.local/share/nvim/LAST_PATH) | Telescope find_files'"
# alias n="XDG_CONFIG_HOME=/mnt/internal/downloads/lua nvim5"
# alias n="nvim5 --clean -S ~/.config/nvim/init.lua"
# alias n="newsboat"
