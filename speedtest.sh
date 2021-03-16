sudo $HOME/.scripts/speedtest-cli --server 864 --simple --no-upload | grep Download | awk '{ print $2}' | awk '{print int($1)"Mbps"}'
