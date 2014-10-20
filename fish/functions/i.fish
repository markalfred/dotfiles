function i
  if [ $interactive_mode ]
    # Already in interactive mode. Do nothing.
  else
    set -g interactive_cmd $argv
    set -g interactive_mode true
    # Allow graceful exit back to default prompt.
    function exit
      set -e interactive_cmd
      set -e interactive_mode
      commandline -r ''
      commandline -f repaint
      functions -e exit
    end
  end
end
