# Since fish loads completion files only when needed, this function
# (from completions/git.fish) could be missing.
function __fish_local_git_branches
  command git branch --no-color ^/dev/null | sgrep -v ' -> ' | sed -e 's/^..//'
end

function __fish_remote_git_branches
  # Pullr takes the "local" style name. Never show "origin".
  command git branch -r --no-color ^/dev/null | sgrep -v ' -> ' | sed -e 's/^..//' -e 's/^origin\///'
end

complete --exclusive --command pullr --short f --long from --no-files --arguments '(__fish_local_git_branches)'
complete --exclusive --command pullr --short i --long into --no-files --arguments '(__fish_remote_git_branches)'
