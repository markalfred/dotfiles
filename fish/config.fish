# Initialize rbenv.
set PATH $PATH $HOME/.rbenv/bin
set PATH $PATH $HOME/.rbenv/shims
rbenv rehash >/dev/null ^&1

# Add python bins.
set PATH $PATH /usr/local/Python/bin

# Set work dir variable.
set -U WORK_DIR $HOME/Repos

# Set fish's path.
set fish_path $HOME/.config/fish

# Set home ip.
set home (cat ~/Dropbox/homeip)

# Imports.
source $fish_path/utils/base_utils.fish
source $fish_path/utils/git_utils.fish

# Better search results background.
set fish_color_search_match --background=5f0087

# Aliases
alias tig 'tig --all'
