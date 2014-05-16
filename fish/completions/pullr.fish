# Since fish loads completion files only when needed, this function
# (from completions/git.fish) could be missing.
function __fish_git_branches
  command git branch --no-color -a ^/dev/null | sgrep -v ' -> ' | sed -e 's/^..//' -e 's/^remotes\///'
end

complete --command pullr --short f --long from --no-files --arguments '(__fish_git_branches)'
complete --command pullr --short i --long into --no-files --arguments '(__fish_git_branches)'
