function i
  if [ $interactive_mode ]
    set -e interactive_cmd
    set -e interactive_mode
    commandline -r ''
    commandline -f repaint
  else
    set -g interactive_cmd $argv
    set -g interactive_mode true
  end
end

function prepend_cmd --on-event fish_postexec
  if [ $interactive_mode ]
    commandline -r "$interactive_cmd "
  end
end
