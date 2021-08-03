# Turn off fish greeting
set fish_greeting ''

# Initialize asdf.
source (brew --prefix asdf)/asdf.fish

# Initialize rbenv.
set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH
rbenv rehash >/dev/null ^&1

# Add python bins.
set PATH $PATH /usr/local/Python/bin

# Set GOPATH and add bins.
set -x GOPATH /usr/local/Go
set PATH $PATH /usr/local/Go/bin

# Set gcloud application credentials key.
set -x GOOGLE_APPLICATION_CREDENTIALS ~/Dropbox/credentials/lecture-genius-service-account-owner-key.json

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
set fish_color_search_match --background=white

# Initialize direnv.
eval (direnv hook fish)

# Aliases
alias tig 'tig --all'
alias rdm 'rake db:migrate'
alias rdms 'rake db:migrate:status'
alias mps 'mix phx.server'
alias mem 'mix ecto.migrate'
alias mems 'mix ecto.migrations'

fish_add_path /usr/local/sbin
