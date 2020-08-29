function git
  if [ push = $argv[1] ]; or [ pu = $argv[1] ]
    if [ (_git_branch_name) = 'master' ]; or [ (_git_branch_name) = 'production' ]
      set -l confirm (input 'Are you sure you want to push this branch?')
      if [ $confirm = y ]
        command git $argv
      end
    else
      command git $argv

      set -l open_pr (input 'Do you want to open a PR?')
      if [ $open_pr = y ]
        hub pull-request
      end
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
