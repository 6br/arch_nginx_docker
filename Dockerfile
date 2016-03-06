FROM pritunl/archlinux

MAINTAINER 6br

RUN \
		pacman -Syu && \
		pacman -S nginx --noconfirm

ADD ./nginx.conf /etc/nginx/nginx.conf

VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

WORKDIR /etc/nginx

EXPOSE 80

ENTRYPOINT /usr/sbin/nginx -g 'daemon off;'
