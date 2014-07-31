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
  print $dark_gray(_current_directory)
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

    if _git_branch_has_upstream
      if [ (_git_behind_by) -gt 0 ]
        print $dark_gray '-' $red (_git_behind_by)
      end
      if [ (_git_ahead_by) -gt 0 ]
        print $dark_gray '+' $green (_git_ahead_by)
      end
    end
  end

  if test -n "$SSH_CONNECTION"
    print $green ' (' (hostname) ')'
  end

  print $normal
end
