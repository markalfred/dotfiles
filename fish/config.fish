# Turn off fish greeting
set fish_greeting ''

# Initialize homebrew.
eval (/opt/homebrew/bin/brew shellenv)

# Initialize asdf.
source (brew --prefix asdf)/asdf.fish

# Add python bins.
set PATH $PATH /usr/local/Python/bin

# Set GOPATH and add bins.
set -x GOPATH /usr/local/Go
set PATH $PATH /usr/local/Go/bin

# Set work dir variable.
set -U WORK_DIR $HOME/Repos

# Set fish's path.
set fish_path $HOME/.config/fish

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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mark/google-cloud-sdk/path.fish.inc' ]; . '/Users/mark/google-cloud-sdk/path.fish.inc'; end

# pnpm
set -gx PNPM_HOME "/Users/mark/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end
# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true
