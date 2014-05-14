# Initialize rbenv.
set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1

# Set work dir variable.
set -U WORK_DIR $HOME/Repos

# Set fish's path.
set fish_path $HOME/.config/fish

# Imports.
source $fish_path/utils/base_utils.fish
source $fish_path/utils/git_utils.fish

# Better search results background.
set fish_color_search_match --background=5f0087

# Aliases
alias tig 'tig --all'
