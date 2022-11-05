FROM ubuntu:22.04

#ENV WEBDAV_USERNAME admin
#ENV WEBDAV_PASSWORD password

RUN apt-get update && apt-get install -y apache2 apache2-utils subversion libapache2-mod-svn openssh-client cron supervisor

#RUN a2enmod dav
RUN a2enmod dav_fs

RUN mkdir /home/svn/ &&\
	touch /etc/subversion/passwd

# Add WebDav configuration
ADD apache/000-default.conf /etc/apache2/sites-enabled/000-default.conf
ADD apache/dav_svn.authz /etc/apache2/dav_svn.authz
ADD scripts/ /home/scripts/

# Set HOME in non /root folder
ENV HOME /home

# Setup auth
# RUN htpasswd -b /etc/subversion/passwd $WEBDAV_USERNAME $WEBDAV_PASSWORD

# chown
RUN chown -R www-data:www-data /home/svn

# Copy cron file
COPY cron/sync /etc/cron.d/sync
 
# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/sync

# Apply cron job
RUN crontab /etc/cron.d/sync
 
# Create the log file to be able to run tail
RUN touch /var/log/plugins.log
RUN touch /var/log/themes.log

EXPOSE 8080

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# By default start up apache in the foreground, override with /bin/bash for interative.
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
#CMD
