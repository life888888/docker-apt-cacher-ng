FROM ubuntu:20.04

COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod 755 /docker-entrypoint.sh

RUN apt-get update -y && yes | apt-get install apt-cacher-ng

RUN sed -i 's/CacheDir: \/var\/cache\/apt-cacher-ng/CacheDir: \/extval\/var\/cache\/apt-cacher-ng/g' /etc/apt-cacher-ng/acng.conf \
 && sed -i 's/LogDir: \/var\/log\/apt-cacher-ng/LogDir: \/extval\/var\/log\/apt-cacher-ng/g' /etc/apt-cacher-ng/acng.conf

# Use volume dir as /extval
WORKDIR /extval
VOLUME  /extval

EXPOSE 3142/tcp

ENTRYPOINT ["/docker-entrypoint.sh"]

# CMD /etc/init.d/apt-cacher-ng start && tail -f /extval/var/log/apt-cacher-ng/*
