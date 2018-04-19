FROM debian:stretch
ARG MIRROR_DEBIAN
# Use nexus repo to speed up build if MIRROR_DEBIAN defined
RUN echo "$APP_ENV $http_proxy $no_proxy" && set -x && [ -z "$MIRROR_DEBIAN" ] || \
     sed -i.orig -e "s|http://deb.debian.org/debian|$MIRROR_DEBIAN/debian9|g ; s|http://security.debian.org|$MIRROR_DEBIAN/debian9-security|g" /etc/apt/sources.list

RUN apt-get -q update && \
    apt-get install -qy --no-install-recommends --force-yes \
    curl ansible python-apt && \
    apt-get autoremove -y && apt-get autoclean -y &&\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# config / playbook / roles
COPY ansible /opt/ansible

