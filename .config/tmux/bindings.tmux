set -g prefix M-Space

#---------------------------------------
#               Windows
#---------------------------------------

# bind -n M-o new-window -c "#{pane_current_path}" 

bind -n M-o new-window -c "#{pane_current_path}" \; \
        send "xdotool sleep 0.1 key quoteright && faint" Enter
        # send "bolt --search" Enter
bind -n M-Enter new-window -c "#{pane_current_path}"

# Navigation
bind -n M-j select-window -p
bind -n M-k select-window -n

# Swapping
bind -n M-K swap-window -d -t :+
bind -n M-J swap-window -d -t :-

# Rename
bind -n M-N command -I "#W" "rename-window -- '%%'"

# # Complement tmux-center-pane; Dynamically kills pane
# bind -n M-';' run '{ [ "$(tmux list-panes | wc -l)" -gt 3 ] && tmux kill-pane; } || tmux kill-window'

#---------------------------------------
#               Sessions
#---------------------------------------

bind -n M-l switch-client -n
bind -n M-h switch-client -p

# Rename
bind -n M-n command -I "#S" "rename-session -- '%%'"

# List
bind l choose-tree

#---------------------------------------
#               Copy Mode
#---------------------------------------

# Spawn/Quit
# bind Escape copy-mode \; send gg
bind Escape copy-mode
bind -T copy-mode-vi Escape send -X cancel

# Navigation
bind -T copy-mode-vi h send -X cursor-left
bind -T copy-mode-vi j send -X cursor-down
bind -T copy-mode-vi J send -X halfpage-down
bind -T copy-mode-vi k send -X cursor-up
bind -T copy-mode-vi K send -X halfpage-up
bind -T copy-mode-vi l send -X cursor-right

# Visual
bind -T copy-mode-vi v send -X begin-selection
bind -T copy-mode-vi V send -X select-line

# Yank
bind -T copy-mode-vi y send -X copy-pipe-and-cancel 'xsel -b'

# Open in Vim
bind -T copy-mode-vi e capture-pane -S -1024 -E 1024 \; \
        save-buffer /tmp/tmux-buffer \; \
        new-window 'nvim /tmp/tmux-buffer' \; \
        delete-buffer

#---------------------------------------
#               Misc
#---------------------------------------

# Toggle status
bind -n M-p set status

# Open pane in vim
bind e run 'tmux capture-pane -S -1024 -E 1024 -p > /tmp/tb' \; \
        new-window 'nvim /tmp/tb && rm -f /tmp/tb'

bind u run 'tmux capture-pane -p > /tmp/tb' \; \
        split-window 'puri /tmp/tb && rm -f /tmp/tb' \;

#---------------------------------------
#               Panes
#---------------------------------------

# Break/Join (i.e. Mark & Replace)
bind m select-pane -m
bind r new-window -c "#{pane_current_path}" \; join-pane \; last-pane \; kill-pane

# Misc
bind h split-window -h -c "#{pane_current_path}"
bind H split-window -c "#{pane_current_path}"

# Navigation
bind -n M-. select-pane -Z -t :.+ \; display-panes
bind -n M-, select-pane -Z -t :.- \; display-panes
bind -n M-> rotate-window -Z -U \; display-panes
bind -n M-< rotate-window -Z -D \; display-panes

# # Resize
# bind -n h resize-pane -L
# bind -n j resize-pane -D
# bind -n k resize-pane -U
# bind -n l resize-pane -R

# Zoom
bind -n M-m resize-pane -Z

#---------------------------------------
#               Exp
#---------------------------------------

# bind f run 'toggle -t &'

#---------------------------------------
#               Panes
#---------------------------------------

# # Spawn
# bind -n M-o split-window -h -c "#{pane_current_path}" \; \
#         swap-pane -d -t :.1 \; \
#         select-layout main-vertical \; \
#         send "bolt --search" Enter
# bind -n M-Enter split-window -h -c "#{pane_current_path}" \; \
#         swap-pane -d -t :.1 \; \
#         select-layout main-vertical \; \
#         send "clear" Enter

# Kill
bind -n M-';' kill-pane
#  bind -n M-';' kill-pane \; \
        #  select-layout main-vertical \; \
        #  select-pane -t :.1

# # Swap
# bind -r i swap-pane -d -t :.2 \; swap-pane -d -t :.1
# bind -r l swap-pane -d -t :.+
# bind -r h swap-pane -d -t :.-


# # Break/Join
# bind -n M-"'" select-pane -m
# bind -n M-'"' join-pane \; \
#         select-layout main-vertical \; \
#         swap-pane -d -t :.1 \;
# bind -n M-':' break-pane -d \; \
#         select-layout main-vertical \; \
#         swap-pane -d -t :.1 \;

#---------------------------------------
#               Sessions
#---------------------------------------

# bind -n M-. if "[ $(tmux ls | wc -l) -lt 2 ]" new-session "switch-client -n"
# bind -n M-, if "[ $(tmux ls | wc -l) -lt 2 ]" new-session "switch-client -p"
# bind h kill-session
# bind l new-session
# bind d detach

#---------------------------------------
#               Misc
#---------------------------------------

# bind Space command-prompt

# # urlscan
# bind u capture-pane -J -p > /tmp/tb \; \
#   new-window "tup /tmp/tb" \; \
#   run-shell 'ns yo'
#   # new-window "urlscan -Hdcr 'launch --link {}' < /tmp/tmux-buffer" \; \

# new-window -n puri 'puri /tmp/tb && rm -f /tmp/tb'
# new-window 'cat /tmp/tb | tup && rm -f /tmp/tb'

# bind -n M-p paste-buffer
# bind P paste-buffer
# bind -n M-b choose-buffer -Z

# bind f command-prompt "find-window -Z -- '%%'"

# Exit
# bind Escape kill-server

# bind -n M-o select-pane -t :.+ \; resize-pane -Z	# next pane in zoomed mode
# bind -n M-j select-pane -t :.+	# next pane

# bind -T prefix h list-keys -N
# bind -n S-F1 list-keys -N

# bind -T copy-mode-vi j send-keys -X cursor-left
# bind -T copy-mode-vi l send-keys -X cursor-down
# bind    -T copy-mode-vi l                    send-keys -X cursor-right

# bind-key -T copy-mode C-Up   send-keys -X scroll-up
# bind-key -T copy-mode C-Down send-keys -X scroll-down

# # urlscan
# bind u capture-pane \; \
#   save-buffer /tmp/tmux-buffer \; \
#   new-window 'urlscan -Hdcr "launch --link {}" < /tmp/tmux-buffer' \; \
#   delete-buffer

# # y and p as in vim
# unbind p
# bind p paste-buffer
# bind-key -T copy-mode-vi 'v' send -X begin-selection
# bind-key -T copy-mode-vi 'y' send -X copy-selection

# bind g select-window -T

# # Capture pane and open in Vim
# bind-key C-c run 'FILE=/tmp/tmux-capture-$(date +%Y%m%d%H%M%S).txt; tmux capture-pane -J -S -102400 -p > $FILE; tmux new-window "reattach-to-user-namespace vim $FILE"'

# # Spawn/Kill
# bind w new-window -c "#{pane_current_path}"
# bind -n M-o new-window -c "#{pane_current_path}" \; \
   send "bolt --search" "Enter"
# bind -n M-Enter new-window -c "#{pane_current_path}"
# bind W kill-window

# # Spawn/Kill
# bind p split-window -h -c "#{pane_current_path}" \; \
#         swap-pane -d -t :.1 \; \
#         select-layout main-vertical \;

# Layout
# bind -n M-'\' select-layout main-vertical
