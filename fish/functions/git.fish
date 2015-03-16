function git
  if [ push = $argv[1] ]
    if [ (_git_branch_name) = 'master' ]
      set -l confirm (input 'Are you sure you want to push master?')
      if [ $confirm = y ]
        command git $argv
      end
    else
      command git $argv
    end

  # Impliment git pull --autostash myself
  else if [ pull = $argv[1] ]
    if [ (_git_has_unstaged_changes) ]
      command git stash
      command git pull
      command git stash pop
    else
      command git pull
    end

  else
    command git $argv
  end
end
