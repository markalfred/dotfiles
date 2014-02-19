function list_colors -d "Print all xterm colors"
  for i in (seq 100 999)
    echo -s (set_color $i) color $i
  end
end
