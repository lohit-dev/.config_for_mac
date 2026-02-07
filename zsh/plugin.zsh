# ================================================================
# HyDE Zsh plugins (Zinit)
# ================================================================

# Zinit setup
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "$ZINIT_HOME/zinit.zsh"

# ------------------------------------------------
# Plugins
# ------------------------------------------------

zinit light zdharma-continuum/history-search-multi-word
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-history-substring-search
zinit light hlissner/zsh-autopair
# zinit light Aloxaf/fzf-tab  # Disabled - causes black box popup
zinit light djui/alias-tips
zinit light b4b4r07/enhancd
# zinit light junegunn/fzf  # Disabled - fzf not installed
zinit light tarrasch/zsh-autoenv
zinit light romkatv/powerlevel10k

# Git helpers
zinit snippet https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git/git.plugin.zsh

# ------------------------------------------------
# Prompt (HyDE)
# ------------------------------------------------
source "$ZDOTDIR/prompt.zsh"

# ------------------------------------------------
# User config LAST
# ------------------------------------------------
source "$ZDOTDIR/user.zsh"
