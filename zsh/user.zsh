#  Startup 
# Commands to execute on startup (before the prompt is shown)
# Check if the interactive shell option is set
# Startup graphics disabled here to prevent duplicate calls
# (hyde/terminal.zsh already handles pokemon-colorscripts/fastfetch)
# This file is sourced twice: once by hyde/terminal.zsh and once by plugin.zsh

#   Overrides 
# HYDE_ZSH_NO_PLUGINS=1 # Set to 1 to disable loading of oh-my-zsh plugins, useful if you want to use your zsh plugins system 
# unset HYDE_ZSH_PROMPT # Uncomment to unset/disable loading of prompts from HyDE and let you load your own prompts
# HYDE_ZSH_COMPINIT_CHECK=1 # Set 24 (hours) per compinit security check // lessens startup time
# HYDE_ZSH_OMZ_DEFER=1 # Set to 1 to defer loading of oh-my-zsh plugins ONLY if prompt is already loaded

if [[ ${HYDE_ZSH_NO_PLUGINS} != "1" ]]; then
    #  OMZ Plugins 
    # manually add your oh-my-zsh plugins here
    plugins=(
        "sudo"
    )
fi

# Terminal settings moved to: $ZDOTDIR/conf.d/terminal.zsh

export EDITOR="nvim"

# Aliases are in: $ZDOTDIR/conf.d/aliases.zsh

# Zoxide - smarter cd
eval "$(zoxide init zsh)"
alias cd="z"
# Note: zi command conflicts with zinit, use __zoxide_zi directly or install fzf for interactive mode

# thefuck - corrects your previous console command
if command -v thefuck &>/dev/null; then
    eval $(thefuck --alias)
fi
