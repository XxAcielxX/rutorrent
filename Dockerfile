FROM crazymax/rtorrent-rutorrent:latest

# set labels
LABEL maintainer="XxAcielxX"

# modifications
RUN \
 echo "**** apply patches for /downloads ****" && \
 sed -ie '96s/themes [*\]/themes/' '/etc/cont-init.d/03-config.sh' && \
 sed -i '97,98d;310,311d' '/etc/cont-init.d/03-config.sh' && \
 sed -ie '5,23s/[*/]complete//' '/tpls/etc/nginx/conf.d/webdav.conf'
COPY '/root/defaults/.rtorrent.rc' '/tpls/.rtorrent.rc'

EXPOSE 6881/udp 8000 8080 9000 50000
VOLUME [ "/data", "/downloads", "/passwd" ]

HEALTHCHECK NONE
