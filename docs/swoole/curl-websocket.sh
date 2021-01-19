#用于shell实现websocket长连接
curl --include \
     --no-buffer \
     --header "Connection: Upgrade" \
     --header "Upgrade: websocket" \
     --header "Host: echo.websocket.org" \
     --header "Origin: https://echo.websocket.org" \
     --header "Sec-WebSocket-Key: NVwjmQUcWCenfWu98asDmg==" \
     --header "Sec-WebSocket-Version: 13" \
     http://127.0.0.1:9501
