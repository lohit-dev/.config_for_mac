#!/usr/bin/env zsh
# ================================================================
# Aliases Configuration
# ================================================================
# All shell aliases in one place for easy management
# Edit this file to add/modify/remove aliases
#
# Quick Tips:
# - VIM MODE: Press ESC for vim keybindings (see VIM-MODE.md)
# - History: Ctrl+R for fuzzy search, or use arrow keys
# - Auto-complete: Start typing and press TAB

# ------------------------------------------------
# General Shortcuts
# ------------------------------------------------
alias c='clear'                                                        # clear terminal
alias vc='code'                                                        # gui code editor

# ------------------------------------------------
# Directory Navigation
# ------------------------------------------------
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Zoxide (smarter cd - remembers frequently used directories)
# cd is aliased to 'z' in user.zsh
# Use: z <partial-name> to jump to directory

# ------------------------------------------------
# File Listings (eza)
# ------------------------------------------------
# Basic listing
alias ls='eza --grid --icons=auto'                                     # short list (horizontal grid)
alias l='eza -lh --icons=auto'                                         # long list
alias la='eza -lha --icons=auto'                                       # long list all (including hidden)
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all sorted
alias ld='eza -lhD --icons=auto'                                       # long list dirs only
alias lt='eza --icons=auto --tree'                                     # list as tree

# ------------------------------------------------
# File Operations
# ------------------------------------------------
alias mkdir='mkdir -p'                                                 # always create parent dirs
alias q='exit'                                                         # exit shell

# ------------------------------------------------
# Fuzzy Finder Aliases (fzf functions)
# ------------------------------------------------
# These functions are defined in functions/fzf.zsh
alias ffec='_fuzzy_edit_search_file_content'                           # fuzzy search file content
alias ffcd='_fuzzy_change_directory'                                   # fuzzy change directory
alias ffe='_fuzzy_edit_search_file'                                    # fuzzy edit file
alias ffch='_fuzzy_search_cmd_history'                                 # fuzzy command history

# ------------------------------------------------
# Custom Aliases
# ------------------------------------------------
# Add your own custom aliases below this line
alias lvim='NVIM_APPNAME=lvim nvim'
alias chad='NVIM_APPNAME=nvim nvim'
