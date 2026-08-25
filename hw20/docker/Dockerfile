FROM nginx:stable-alpine3.24-perl

RUN apk add --no-cache curl \
    && curl -fsS https://ifconfig.me \
       > /usr/share/nginx_configs/html/index.html

