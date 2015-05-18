# Set the base image
FROM dtanakax/storage

# File Author / Maintainer
MAINTAINER Daisuke Tanaka, dtanakax@gmail.com

ENV RM_VERSION 1.1.7

RUN opkg-install bash

# Create directories
RUN mkdir -p /var/www/
RUN chmod -R 755 /var/www/

# Setup Rockmongo
ADD https://github.com/iwind/rockmongo/archive/$RM_VERSION.zip /rockmongo-master.zip
RUN unzip /rockmongo-master.zip && \
    mv /rockmongo-$RM_VERSION /html && \
    mv /html /var/www/ && \
    rm -f /rockmongo-master.zip && \
    rm -f /var/www/html/config.php

COPY config.php /var/www/html/config.php
COPY entrypoint.sh /entrypoint.sh
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html && \
    chmod +x /entrypoint.sh

# Environment variables
ENV DB_NAME         mongodb
ENV DB_HOST         localhost
ENV DB_PORT         27017
ENV DB_USER         admin
ENV DB_PASSWORD     admin
ENV DB_AUTH         false
ENV DB_REPLICA_NAME *None*

ENTRYPOINT ["./entrypoint.sh"]

# Define mountable directories.
VOLUME ["/var/www/html"]

CMD ["/bin/sh"]

