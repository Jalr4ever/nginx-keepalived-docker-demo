FROM nginx:1.13.5-alpine

RUN apk update && apk upgrade

COPY nginx.conf /etc/nginx/nginx.conf

RUN apk add --no-cache bash curl ipvsadm iproute2 openrc keepalived busybox && \
    rm -f /var/cache/apk/* /tmp/*

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
