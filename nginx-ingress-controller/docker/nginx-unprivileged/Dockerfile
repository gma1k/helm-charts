FROM nginxinc/nginx-unprivileged:1.14.2-alpine

COPY --from=nginx/nginx-ingress:1.14.2 /nginx-ingress /nginx-ingress

COPY --from=nginx/nginx-ingress:1.14.2 /etc/nginx/template/nginx.tmpl /etc/nginx/template/nginx.tmpl

CMD ["/nginx-ingress"]
