FROM alpine:3.15

RUN apk add --no-cache nginx shadow

RUN useradd -r -s /sbin/nologin -g www-data -d /var/www nginxuser

RUN chown -R nginxuser:www-data /var/lib/nginx /var/log/nginx /etc/nginx

COPY nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;", "-c", "/etc/nginx/nginx.conf"]
