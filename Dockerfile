FROM php:8.1-apache

# Cài đặt công cụ giải nén cần thiết
RUN apt-get update && apt-get install -y curl unzip && rm -rf /var/lib/apt/lists/*

# Copy file cấu hình ngụy trang vào thư mục chạy
COPY config.json /var/www/html/config.json
COPY start.sh /var/www/html/start.sh

# Tạo một trang web giả lập để qua mắt bộ quét
RUN echo "<html><body><h1>Web Server is Running Safely</h1></body></html>" > /var/www/html/index.php

RUN chmod +x /var/www/html/start.sh

EXPOSE 80
CMD ["/var/www/html/start.sh"]
