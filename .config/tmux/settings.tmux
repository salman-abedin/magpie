# Set coorect $TERM value
#  set -g default-terminal "${TERM}"
set -g default-terminal "tmux-256color"
#  set -g default-terminal "screen-256color"
#  set -g default-terminal "screen-256color-bce"
#  set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
#  set -g default-terminal "alacritty"
#  set-option -ga terminal-overrides ",xterm-256color:Tc"

# fix delay time between tmux & vim
set -sg escape-time 0

# default shell
#  set -g default-command /bin/zsh
#  set -g default-shell /bin/zsh

# Needed as on tmux 1.9 and up (defaults to off).
# Added in tmux commit c7a121cfc0137c907b7bfb.
set -g focus-events on

# Don't wrap searches; it's super confusing given tmux's reverse-ordering of
# position info in copy mode.
set -w -g wrap-search off

# Start a non-login shell
#  set -g default-command "${SHELL}"

# Prevents annoying activity popup
set -g visual-activity off

# super useful when using "grouped sessions" and multi-monitor setup
setw -g aggressive-resize on

# Copy-Mode key bindings
setw -g mode-keys vi

# Mouse Support
set -g mouse on

# Misc
set -g history-limit 102400
set -g monitor-activity off
set -g detach-on-destroy off
set -wg automatic-rename on
set -g display-panes-time 200
set -g repeat-time 500

#---------------------------------------
#               Exp
#---------------------------------------

# # But don't change tmux's own window titles.
# set -wg automatic-rename off

# # Don't wait for an escape sequence after seeing prefix
# set -s escape-time 0

# set -g set-clipboard external

# # Highlight active window.
# set -w -g window-status-current-bg red

## update the TERM variable of terminal emulator when creating a new session or attaching a existing session
# set -g update-environment 'DISPLAY SSH_ASKPASS SSH_AGENT_PID SSH_CONNECTION WINDOWID XAUTHORITY TERM'
## determine if we should enable 256-colour support
# if "[[ ${TERM} =~ 256color || ${TERM} == fbterm ]]" 'set -g default-terminal screen-256color'

#---------------------------------------
#               Plugins
#---------------------------------------

# Resurrect
# run-shell $GIT/others/tmux-resurrect/resurrect.tmux
# set -g @resurrect-processes ':all:'
# set -g @resurrect-dir '~/.local/share/tmux/resurrect'

# bind -n M-s run-shell $GIT/others/tmux-resurrect/scripts/save.sh
# bind -n M-r run-shell $GIT/others/tmux-resurrect/scripts/restore.sh
