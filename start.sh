#!/bin/bash

# Tự động tải Xray Core về ngay khi container khởi động
curl -L -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip
mkdir -p /tmp/xray-core
unzip /tmp/xray.zip -d /tmp/xray-core

# Di chuyển cấu hình vào đúng chỗ và chạy ngầm trên cổng Web ($PORT của Render cấp)
sed -i "s/PORT_PLACEHOLDER/$PORT/g" /var/www/html/config.json

# Bật Apache chạy web ở giao diện ngoài để che mắt
apache2-foreground &

# Chạy Xray Core thật sự ở bên trong
/tmp/xray-core/xray -c /var/www/html/config.json
