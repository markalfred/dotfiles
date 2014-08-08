function git
  if [ (count $argv) = 0 ]
    if [ $interactive_git_mode ]
      # Already in interactive git mode. Do nothing.
    else
      set -g interactive_git_mode true
      # Allow graceful exit back to default prompt.
      function exit
        set -e interactive_git_mode
        commandline -r ''
        commandline -f repaint
        functions -e exit
      end
    end

  else if [ push = $argv[1] ]
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
    if [ (_git_is_dirty) ]
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
