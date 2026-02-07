# Suppress instant prompt console output warning (pokemon-colorscripts outputs during init)
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load conf.d files (always load, but check for duplicate pokemon)
if [[ -z "$_CONF_LOADED_THIS_SESSION" ]]; then
    export _CONF_LOADED_THIS_SESSION=1
    export _SHOW_POKEMON=1
else
    export _SHOW_POKEMON=0
fi

for file in "$ZDOTDIR/conf.d/"*.zsh(N); do
    [[ -r "$file" ]] && source "$file"
done

# Load plugin system (must come after conf.d)
if [[ -f "$ZDOTDIR/plugin.zsh" ]]; then
    source "$ZDOTDIR/plugin.zsh"
fi

# Add user configurations here
# For HyDE to not touch your beloved configurations,
# we added a config file for you to customize HyDE before loading zshrc
# Edit $ZDOTDIR/.user.zsh to customize HyDE before loading zshrc

#  Plugins 
# oh-my-zsh plugins are loaded  in $ZDOTDIR/.user.zsh file, see the file for more information

#  Aliases 
# Override aliases here in '$ZDOTDIR/.zshrc' (already set in .zshenv)

# All aliases moved to: $ZDOTDIR/conf.d/aliases.zsh

#  This is your file 
# Add your configurations here
 export EDITOR=nvim
# export EDITOR=code 

# unset -f command_not_found_handler # Uncomment to prevent searching for commands not found in package manager

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
# Postgres - use whichever version is installed (install.sh installs 17 for fresh installs)
if [[ -d "/opt/homebrew/opt/postgresql@18" ]]; then
  export PATH="/opt/homebrew/opt/postgresql@18/bin:$PATH"
  export LDFLAGS="-L/opt/homebrew/opt/postgresql@18/lib"
  export CPPFLAGS="-I/opt/homebrew/opt/postgresql@18/include"
elif [[ -d "/opt/homebrew/opt/postgresql@17" ]]; then
  export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
  export LDFLAGS="-L/opt/homebrew/opt/postgresql@17/lib"
  export CPPFLAGS="-I/opt/homebrew/opt/postgresql@17/include"
fi

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
