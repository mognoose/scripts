VPN=$(nmcli con show --active | grep vpn )
NAME=$(echo $VPN | awk '{print $1}')

echo $NAME
