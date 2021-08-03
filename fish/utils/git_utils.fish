function _in_git_repo
  echo (command git rev-parse --is-inside-work-tree 2> /dev/null)
end

function _git_repo_name
  echo (basename (command git rev-parse --show-toplevel 2> /dev/null) 2> /dev/null)
end

function _git_subdirectory
  echo (_sanitized_path (command git rev-parse --show-prefix 2> /dev/null))
end

function _git_branch_name
  echo (command git symbolic-ref --short HEAD 2> /dev/null)
end

function _git_is_dirty
  echo (command git status -s --ignore-submodules=dirty 2> /dev/null)
end

function _git_has_staged_changes
  echo (command git status | grep 'Changes to be committed:' 2> /dev/null)
end

function _git_has_unstaged_changes
  echo (command git status | grep 'Changes not staged for commit:' 2> /dev/null)
end

function _git_has_untracked_files
  echo (command git status | grep 'Untracked files:' 2> /dev/null)
end

function _git_has_stash
  echo (command git stash list 2> /dev/null)
end

function _git_stash_is_on_current_branch
  echo (command git stash list --grep (_git_branch_name) 2> /dev/null)
end

function _git_branch_has_upstream
  command git show "@{u}" >/dev/null 2> /dev/null
  return $status
end

function _git_behind_by
  echo (command git rev-list --left-right "@{u}..." | grep -c '<')
end

function _git_ahead_by
  echo (command git rev-list --left-right "@{u}..." | grep -c '>')
end

function _git_upstream_branch
  echo (command git rev-parse --abbrev-ref --symbolic-full-name "$argv@{u}")
end
