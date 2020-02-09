FROM ubuntu:19.10

ENV WEBDAV_USERNAME admin
ENV WEBDAV_PASSWORD password

RUN apt-get update && apt-get install -y apache2 apache2-utils subversion libapache2-mod-svn cron

# Cron stuff
COPY cron/hello-world /etc/cron.d/hello-world
RUN chmod 0644 /etc/cron.d/hello-world
RUN crontab /etc/cron.d/hello-world
RUN touch /var/log/cron.log

RUN a2enmod dav_fs

RUN mkdir /home/svn/ &&\
	touch /etc/subversion/passwd

# Add WebDav configuration
ADD apache/000-default.conf /etc/apache2/sites-enabled/000-default.conf

# Set HOME in non /root folder
ENV HOME /home

# Setup auth
RUN htpasswd -b /etc/subversion/passwd $WEBDAV_USERNAME $WEBDAV_PASSWORD

# chown
RUN chown -R www-data:www-data /home/svn

EXPOSE 80

# By default start up apache in the foreground, override with /bin/bash for interative.
CMD cron && /usr/sbin/apache2ctl -D FOREGROUND