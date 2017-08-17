function reconnect
  while true
    if ping -c 1 -q google.com
      sleep 5
      clear
    else
      echo (date) -- Reconnecting...
      sudo ipconfig set en0 DHCP
      sleep 10
      clear
    end
  end
end
