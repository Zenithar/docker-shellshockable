FROM ubuntu:14.04
MAINTAINER Thibault NORMAND <me@zenithar.org>

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/run/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2

RUN apt-get update && apt-get install -y apache2

RUN mkdir /var/run/apache2

ADD cgi-bin/shockme.cgi /usr/lib/cgi-bin/
RUN chmod +x /usr/lib/cgi-bin/shockme.cgi

RUN a2enmod cgid

# Install vulnerable bash
RUN apt-get install -y build-essential wget
RUN wget https://ftp.gnu.org/gnu/bash/bash-4.3.tar.gz && \
    tar zxvf bash-4.3.tar.gz && \
    cd bash-4.3 && \
    ./configure && \
    make && \
    make install

EXPOSE 80

ENTRYPOINT ["/usr/sbin/apache2"]

CMD ["-D", "FOREGROUND"]
