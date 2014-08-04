# Print argument to screen.
function print
  echo -ns $argv
end

# True if ctrl+d was used to exit.
function _from_ctrl_d
  echo (builtin status -t | grep "in function 'delete-or-exit'")
end

function _sanitized_path
  echo /$argv | sed -e 's|/$||'
end

function _current_directory
  if [ (_in_git_repo) ]
    print (_git_repo_name)(_git_subdirectory)
  else
    print (pwd | sed -e "s|^$HOME|~|")
  end
end

function _current_host
  if test -n "$SSH_CONNECTION"
    print '(' (hostname | cut -d . -f 1) ')'
  end
end

function input
  function _input_prompt
    set_color green
    print $msg
    set_color normal
    print ' ⟩ '
    set_color blue
  end

  set -g msg $argv
  read -p _input_prompt resp
  set -e msg
  echo $resp
end
