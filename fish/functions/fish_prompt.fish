function fish_prompt
  set -l normal (set_color normal)
  set -l blue (set_color blue)
  set -l red (set_color red)
  set -l green (set_color green)
  set -l dark_gray (set_color 465)

  set -l interactive_mode_color

  if [ $interactive_mode ]
    set interactive_mode_color $blue
  else
    set interactive_mode_color $dark_gray
  end

  # First, show Current Directory / Project.
  print $dark_gray (_current_directory)

  # Next, show git branch and dirty state.
  if [ (_git_branch_name) ]
    print $dark_gray ' : '
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

  # Then, maybe show git newfile/stash indicators.
  if [ (_git_branch_name) ]
    if [ (_git_has_untracked_files) ]
      print ' '
      print $red '⑃'
    end

    if [ (_git_has_stash) ]
      if not [ (_git_has_untracked_files) ]
        print ' '
      end

      if [ (_git_stash_is_on_current_branch) ]
        print $green
      else
        print $red
      end

      print '⑂'
    end
  end

  # Finally, show ssh host if connected.
  if test -n "$SSH_CONNECTION"
    print $green ' ' (_current_host)
  end

  print $interactive_mode_color ' ⟩ ' $normal

  if [ $interactive_mode ]
    commandline -r "$interactive_cmd "
  end
end
