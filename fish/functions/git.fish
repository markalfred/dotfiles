function git
  if [ (count $argv) -gt 0 ]
    command git $argv
  else if [ $interactive_git_mode ]
    # Already in interactive git mode. Do nothing.
  else
    set -g interactive_git_mode true

    # Allow graceful exit back to default prompt.
    function exit
      set -e interactive_git_mode
      commandline -r ''
      functions -e exit
    end
  end
end
