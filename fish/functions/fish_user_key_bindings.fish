function fish_user_key_bindings
  bind \cd 'exit' # Ctrl + D: always exit

  bind “ 'prevd; commandline -f repaint' # Alt + [: back
  bind ‘ 'nextd; commandline -f repaint' # Alt + ]: forward
end
