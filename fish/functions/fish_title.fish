function fish_title
  pwd | sed -e "s|$WORK_DIR/||" -e "s|^$HOME|~|"
end
