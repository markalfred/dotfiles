function fish_prompt
  set -l normal (set_color normal)
  set -l dark_gray (set_color 465)
  set -l blue (set_color blue)

  if [ $interactive_git_mode ]
    print $blue
  else
    print $dark_gray
  end

  print '⟩ ' $normal

  if [ $interactive_git_mode ]
    commandline -r 'git '
  end
end
