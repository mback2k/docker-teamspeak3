FROM mback2k/ubuntu:rolling

MAINTAINER Marc Hoersken "info@marc-hoersken.de"

RUN adduser --disabled-password --disabled-login --system --group \
        --uid 9987 --home /data teamspeak

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        bzip2 mariadb-client libmariadb2 \
        locales supervisor && \
    apt-get clean

RUN locale-gen en_US en_US.UTF-8 && dpkg-reconfigure locales
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8

RUN mkdir -p /app
WORKDIR /app

ADD http://dl.4players.de/ts/releases/3.0.13.8/teamspeak3-server_linux_amd64-3.0.13.8.tar.bz2 /app
RUN tar xfvj teamspeak3-server_linux_amd64-3.0.13.8.tar.bz2
RUN chown root:root -R /app/teamspeak3-server_linux_amd64

RUN ln -s /app/teamspeak3-server_linux_amd64/ts3server /usr/local/bin/teamspeak3
RUN ln -s /data/logs /app/teamspeak3-server_linux_amd64/logs
RUN ln -s /data/files /app/teamspeak3-server_linux_amd64/files

VOLUME /data

EXPOSE 9987/udp 10011/tcp 30033/tcp

ADD docker-entrypoint.d/ /run/docker-entrypoint.d/

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
