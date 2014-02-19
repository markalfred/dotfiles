# Imports
. $fish_path/utils/base_utils.fish
. $fish_path/utils/git_utils.fish


function fish_right_prompt
  set -l red (set_color red)
  set -l green (set_color green)
  set -l dark_gray (set_color 465)

  # First, maybe show git newfile/stash indicators.
  if [ (_git_branch_name) ]
    if [ (_git_has_untracked_files) ]
      print $red '? '
    end

    if [ (_git_has_stash) ]
      if [ (_git_stash_is_on_current_branch) ]
        print $green
      else
        print $red
      end

      print '$ '
    end
  end

  # Then, show Current Directory / Project.
  print $dark_gray
  pwd | sed -e "s|$WORK_DIR/||" -e "s|^$HOME|~|"

  # Finally, show git branch and dirty state.
  if [ (_git_branch_name) ]
    print ':'
    # Show git branch name
    if [ (_git_has_unstaged_changes) ]
      print $red
    else if [ (_git_has_staged_changes) ]
      print $green
    else
      print $dark_gray
    end
    print (_git_branch_name)
  end

  print $normal
end
