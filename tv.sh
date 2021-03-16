ip=192.168.1.4

row=$(sh $HOME/.scripts/print_ircc_codes.sh $ip | awk '/"'$1'"/{getline; print}')
res=$(echo $row | awk {'print $2'})
code=$(echo $res | awk -F'"' {'print $2'})

cmd="<?xml version=\"1.0\"?><s:Envelope xmlns:s=\"http://schemas.xmlsoap.org/soap/envelope/\" s:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\"><s:Body><u:X_SendIRCC xmlns:u=\"urn:schemas-sony-com:service:IRCC:1\"><IRCCCode>$code</IRCCCode></u:X_SendIRCC></s:Body></s:Envelope>"

req=$(curl -w "%{http_code}" --silent -XPOST http://$ip/sony/IRCC -d "$cmd" -H 'Content-Type: text/xml; charset=UTF-8' -H 'SOAPACTION: "urn:schemas-sony-com:service:IRCC:1#X_SendIRCC"' -H "X-Auth-PSK: 1612" -o /dev/null )

if [ "$req" = "200" ]; then
  echo "✓"
else
  echo "Command failed (HTTP_CODE: $req, try running it in a console)"
  exit 1
fi
