function fish_prompt
  set -l normal (set_color normal)
  set -l dark_gray (set_color 465)
  set -l blue (set_color blue)

  if [ $interactive_mode ]
    print $blue
  else
    print $dark_gray
  end

  print '⟩ ' $normal

  if [ $interactive_mode ]
    commandline -r "$interactive_cmd "
  end
end
