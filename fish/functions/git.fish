function git
  if [ push = $argv[1] ]; or [ pu = $argv[1] ]
    if [ (_git_branch_name) = 'master' ]; or [ (_git_branch_name) = 'production' ]
      set -l confirm (input 'Are you sure you want to push this branch?')
      if [ $confirm = y ]
        command git $argv
      end
    else if [ -f = $argv[2] ]; or [ --force = $argv[2] ]
      set -l confirm (input 'Use --force-with-lease instead? (Yn)')
      if [ $confirm = n ]
        command git $argv
      else
        echo "git push --force-with-lease"
        command git push --force-with-lease
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
