function tmux_colours -d "Print all colours"
  for i in (seq 0 255)
    printf "\x1b[38;5;"
    printf {$i}mcolour{$i}\n
  end
end
