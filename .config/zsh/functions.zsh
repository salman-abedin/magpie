#!/usr/bin/env zsh

pI (){
  [ -d env ] || virtualenv env
  source env/bin/activate
  [ -f requirements.txt ] && pip install -r requirements.txt
}

#---------------------------------------
#               Git
#---------------------------------------

#  griH() {
  #  COMMIT_COUNT=$(git rev-list --count master)
  #  git rebase -i HEAD~$((COMMIT_COUNT - 1))
#  }

merge() {
  git checkout master > /dev/null 2>&1
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

#  gcg() { git clone git@gist.github.com:"$1".git; }

#---------------------------------------
#               DB
#---------------------------------------

#  mi() {
  #  [ -d /run/mysqld ] || doas -n mkdir /run/mysqld
  #  doas -n chown -R salman /run/mysqld /var/lib/mysql
  #  mysqld --user=salman
#  }

#  post() {

  #  if [ ! -d /run/postgresql ]; then
    #  doas -n mkdir -p /run/postgresql
    #  doas -u $USER chown -R $USER /run/postgresql
  #  fi

  #  if [ ! -d /usr/local/var/postgres ]; then
    #  doas -n mkdir -p /usr/local/var/postgres
    #  doas -u $USER chown -R $USER /usr/local/var/postgres
  #  fi

  #  postgres -D /usr/local/var/postgres
#  }

#---------------------------------------
#               Misc
#---------------------------------------


launch_dpi(){
  program=$1
  shift
  arguments=$*
  setsid $program --force-device-scale-factor=$(get-dpi -f) $arguments > /dev/null 2>&1
}

#  alias b="setsid brave > /dev/null 2>&1"
b(){ launch_dpi brave $*; }
dis(){ launch_dpi discord; }
fire(){ launch_dpi firefox; }
muse(){ launch_dpi musescore; }
q(){ launch_dpi qutebrowser; }
s(){ launch_dpi spotify; }
S(){ launch_dpi skypeforlinux; }
z(){ launch_dpi zoom; }
vir(){ launch_dpi virtualbox; }

#  fe(){
  #  npx -p node-firestore-import-export firestore-export -a credentials.json -b backup.json
#  }


# img2webp(){
#   find $PWD -name "*.jpg" -o -name "*.png" \
#     -exec cwebp -o {}.webp -- {} \;
# }

#  tel() {
  #  nvim +"cd $1 | Telescope find_files"
#  }

#  denim(){ tel /mnt/internal/git/work/denim/src; }
#  3zc(){ tel /mnt/internal/git/work/3ZC/src; }

#  oi(){
  #  mogrify \
    #  -strip \
    #  -colorspace RGB \
    #  -interlace Plane \
    #  -gaussian-blur 0.05 \
    #  -quality 50 \
    #  -path $PWD/optimized/ \
    #  $PWD/*.jpg
#  }

#  A() {
  #  adb kill-server
  #  daas adb start-server
#  }

#  packages() { expac '%m %n' | sort -n; }
#  h2p() { wkhtmltopdf --enable-local-file-access "$1" "${1%.*}.pdf"; }
#  gesr() { gpg -esr "$MAIL_BOX" "$1" && rm "$1"; }
# compress() { tar cvzf "compressed.tar" "$@"; }
#  tcf() { tar cf "$1".tar "$1"; }

#  h() {
  #  tail -25 ~/.config/zsh/history |
    #  sed -e 's/.*;//' \
      #  -e '1i#!/bin/sh' |
      #  nvim
#  }

#  N() {
  #  pidof mpd > /dev/null || mpd 2> /dev/null
  #  ncmpcpp
#  }

#  vpn() { doas -- openvpn --config ~/.local/share/misc/vpnbook-us1-tcp80.ovpn; }
#  flg() { fc-list | grep -i "$1"; }
#  ug() { doas -n -- grub-mkconfig -o /boot/grub/grub.cfg; }
#  dbt() {
   #  docker build -t "$1" "$PWD"
#  }
#  view() {
  #  setsid -f qutebrowser \
    #  localhost:"$1" > /dev/null 2>&1
   #  # http://192.168.0.100:"$1" > /dev/null 2>&1
#  }
#  graph() {
  #  setsid -f surf \
    #  localhost:8022/graphql > /dev/null 2>&1
#  }
#  pdf2png() { pdftoppm -png "$1" > converted.png; }
#  u(){ sort "$@" | uniq -u }

#  dy(){
  #  cd /mnt/internal/git/work/yy_ventures/
  #  yarn generate
  #  cd /mnt/internal/git/work/yy_ventures/dist
  #  zip -r dist.zip *
  #  mv /mnt/internal/git/work/yy_ventures/dist/dist.zip /mnt/internal/downloads
#  }

# skp(){
  # ssh-keygen -t rsa -q -b 4096 -f /tmp/key -N '' && cat /tmp/key | xsel -b
# }

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

#  sk(){
  #  LOCATION=$PWD
  #  cd /tmp
  #  rm key key.pub
  #  ssh-keygen -t rsa -f key -q -N '' && cat key | xsel -b
  #  ssh-copy-id -i key.pub "$1"
  #  cd $LOCATION
#  }

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

tdg(){
    if grep gitlab /etc/hosts > /dev/null; then
        doas -n sed -i '$d' /etc/hosts
        notify-send 'Disabled Gitlab SSH'
    else
        echo 10.1.0.47 gitlab.dsinnovators.com | doas -n tee -a /etc/hosts
        ssh-keygen -R gitlab.dsinnovators.com
        notify-send 'Enabled Gitlab SSH'
    fi
}
