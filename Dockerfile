# Set the base image
FROM tanaka0323/storage

# File Author / Maintainer
MAINTAINER Daisuke Tanaka, tanaka@infocorpus.com

RUN opkg-install bash

# Environment variables
ENV DB_NAME         mongodb
ENV DB_HOST         localhost
ENV DB_PORT         27017
ENV DB_USER         admin
ENV DB_PASSWORD     admin
ENV DB_AUTH         True
# ENV DB_REPLICA_NAME 

# Create directories
RUN mkdir -p /var/www/
RUN chmod -R 755 /var/www/

# Setup Rockmongo
ADD https://github.com/gilacode/rockmongo/archive/master.zip /rockmongo-master.zip
RUN unzip /rockmongo-master.zip
RUN mv /rockmongo-master /html && \
    mv /html /var/www/
RUN rm -f /rockmongo-master.zip
RUN rm -f /var/www/html/config.php
COPY config.php /var/www/html/config.php
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html

ADD entrypoint.sh /var/www/html/entrypoint.sh
RUN chown root:root /var/www/html/entrypoint.sh
RUN chmod +x /var/www/html/entrypoint.sh

# Define mountable directories.
VOLUME ["/var/www/html"]

# Executing sh
ENTRYPOINT ./var/www/html/entrypoint.sh