#!/usr/bin/env zsh
# ================================================================
# Terminal Environment Configuration
# ================================================================
# Handles terminal compatibility and environment setup

# ------------------------------------------------
# Ghostty Terminal Support
# ------------------------------------------------
if [[ "$TERM" == "xterm-ghostty" ]]; then
    export TERM="xterm-256color"
fi

# ------------------------------------------------
# General Terminal Settings
# ------------------------------------------------
# Enable 256 color support
if [[ -z "$COLORTERM" ]]; then
    export COLORTERM=truecolor
fi

# Fix for various terminal emulators that don't set TERM correctly
case "$TERM" in
    xterm-ghostty)
        export TERM="xterm-256color"
        ;;
    xterm)
        export TERM="xterm-256color"
        ;;
    screen)
        export TERM="screen-256color"
        ;;
esac

# ------------------------------------------------
# Terminal Capabilities
# ------------------------------------------------
# Enable better terminal behavior
export LESS="-R -F -X"                    # Better less output
export PAGER="less"                       # Default pager
export MANPAGER="less"                    # Man page pager

# ------------------------------------------------
# Locale Settings
# ------------------------------------------------
# Ensure proper UTF-8 support
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
