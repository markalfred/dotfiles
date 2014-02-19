# Initialize rbenv.
set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1

# Set work dir variable.
set -U WORK_DIR $HOME/Repos

# Set fish's path.
set fish_path $HOME/.config/fish
