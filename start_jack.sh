#!/bin/bash

# Config
http_server_port=11811
response_port=44204
server_ip="127.0.0.1"

# Main
echo "-- Starting Jack --"
echo "[+] Generating response file..."
echo "HTTP/1.1 204 No Content\n\n" > nocontentresponse
echo "[+] Starting servers..."
read -p "[?] Accessing Jack on local or public interfaces (l/p): " -n 1 -r
echo
if [[ $REPLY == "p" ]]; then
 server_ip=$(wget --quiet -O - https://wtfismyip.com/text)
fi

## Starting Python Server
python -m SimpleHTTPServer $http_server_port &
py_job=$!

## This will kill the background python server when Ctrl+C is pressed
trap "echo;echo '[+] Terminating background Python server...'; kill "$py_job"; rm nocontentresponse; echo; echo '-- Thanks for using Jack! --'; exit" SIGINT SIGQUIT

# Echo, echo ... echo
echo -e "[+] Jack Server: \e[92mhttp://$server_ip:$http_server_port/\e[39m "
echo -e "[+] 204 Response: \e[92mhttp://$server_ip:$response_port/\e[39m"
echo "[+] Jack started, do the ClickJack dance! (/^o^)/ \\(^o^\\)"

## Starting NetCat Server
while true
 do nc -nlv $response_port < nocontentresponse
done

