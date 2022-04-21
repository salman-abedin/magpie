#!/usr/bin/env zsh

#  ╔══════════════════════════════════════════════════════════════════════
#  ║                              Local
#  ╚══════════════════════════════════════════════════════════════════════

. ~/.config/zsh/zshrc_private 2> /dev/null
. /usr/share/fzf/key-bindings.zsh 2> /dev/null
. /usr/share/fzf/completion.zsh 2> /dev/null
. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
. /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null

#  ╔══════════════════════════════════════════════════════════════════════
#  ║                              Servers
#  ╚══════════════════════════════════════════════════════════════════════

. ~/.local/share/fzf/completion.zsh 2> /dev/null
. ~/.local/share/fzf/key-bindings.zsh 2> /dev/null
. ~/.local/share/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
. ~/.local/share/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
