#=======================================
#              Status
#=======================================

set -g status-position top
# set -g status-justify centre
set -g status-justify left
set -g status-style bg=default
set -g status-fg white
set -g status-interval 60
set -g status-left-length 30

# set-option -g status-left '💻 #[fg=magenta]#S                    '
# set -g status-right '                                #(date +"🕰  %H:%M")'
set-option -g status-left '📒 #[fg=magenta]#S '
set -g status-right ''


#---------------------------------------
#               Pane
#---------------------------------------

set -g pane-border-status off
# set -g pane-border-status bottom
set -g pane-border-format "#P"
# set -g pane-border-format "#{pane_index} #{pane_current_command}"
set -g pane-active-border-style fg=colour0
# set -g pane-active-border-style fg=red
set -g pane-border-style fg=blue
set -g main-pane-width 91

#---------------------------------------
#               Window
#---------------------------------------

# Dynamically update iTerm tab and window titles.
set -g set-titles on

# Index starts from 1
set -g base-index 1
set -g pane-base-index 1

# Renumber windows when a window is closed
set -g renumber-windows on

# Renumber session
set-hook -g session-created "run tmux-renumber-sessions"
set-hook -g session-closed "run tmux-renumber-sessions"

# # Auto Center Pane
# set-hook -g pane-focus-in 'run tmux-center-pane'

# Show bells in window titles.
set -g window-status-bell-style fg=yellow,bold,underscore

# #T      = standard window title (last command, see ~/.bash_profile)
# #h      = short hostname
# #S      = session name
# #W      = tmux window name
set -g set-titles-string "#T : #h > #S > #W"

setw -g window-status-format  '#[fg=blue]#I.#W '
setw -g window-status-current-format \
'#[fg=red]#I.#W '

#---------------------------------------
#               Exp
#---------------------------------------

# Undercurl
#  set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'  # undercurl support
#  set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'  # underscore colours - needs tmux-3.0
#  set -as terminal-overrides ',${TERM}:RGB'

# set -g status-right '                                       '
# set -g status-right '              #(panel -d)'
# set -g status-right '                          #(echo $USER)@#h'
# set-option -g status-left '                             '
