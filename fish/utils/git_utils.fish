function _git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _git_is_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function _git_has_staged_changes
  echo (command git status | grep '# Changes to be committed:' ^/dev/null)
end

function _git_has_unstaged_changes
  echo (command git status | grep '# Changes not staged for commit:' ^/dev/null)
end

function _git_has_untracked_files
  echo (command git status | grep '# Untracked files:' ^/dev/null)
end

function _git_has_stash
  echo (command git stash list ^/dev/null)
end

function _git_stash_is_on_current_branch
  echo (command git stash list --grep (_git_branch_name) ^/dev/null)
end

function _git_behind_by
  echo (command git rev-list --left-right "@{u}..." | grep -c '<')
end

function _git_ahead_by
  echo (command git rev-list --left-right "@{u}..." | grep -c '>')
end
