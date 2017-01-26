#!/bin/bash

# Config
http_server_port=11811
response_port=44204
localip=$(wget --quiet -O - https://wtfismyip.com/text)

# Main
echo "[+] Generating response file..."
echo "HTTP/1.1 204 No Content\n\n" > nocontentresponse
echo "[+] Starting servers..."

# Starting Python Server
python -m SimpleHTTPServer $http_server_port &
py_job=$!

# This will kill the background python server when ctrl+c is pressed
trap "echo;echo '[+] Terminating background Python server...'; kill "$py_job"; rm nocontentresponse; echo; echo '-- Thanks for using Jack! --'; exit" SIGINT SIGQUIT

# Echo, echo ... echo
echo "[+] Jack Server: http://$localip:$http_server_port/ "
echo "[+] 204 Response: http://$localip:$response_port/"
echo "[+] Jack started, do the ClickJack dance! /(^o^)/"

# Starting NetCat Server
while true
 do nc -nlvp $response_port < nocontentresponse
done
