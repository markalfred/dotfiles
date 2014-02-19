# Print argument to screen.
function print
  echo -ns $argv
end

# True if ctrl+d was used to exit.
function _from_ctrl_d
  echo (builtin status -t | grep "in function 'delete-or-exit'")
end
