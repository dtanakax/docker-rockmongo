# Set the base image
FROM tanaka0323/storage

# File Author / Maintainer
MAINTAINER Daisuke Tanaka, tanaka@infocorpus.com

# Environment variables
ENV DB_HOST         localhost
ENV DB_PORT         27017
ENV DB_USER         admin
ENV DB_PASSWORD     admin
ENV DB_AUTH         true
# ENV DB_REPLICA_NAME 

# Create directories
RUN mkdir -p /var/www/
RUN chmod -R 755 /var/www/

ADD entrypoint.sh /entrypoint.sh
RUN chown root:root /entrypoint.sh
RUN chmod +x /entrypoint.sh

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

# Define mountable directories.
VOLUME ["/var/www/html"]

ENTRYPOINT ["/entrypoint.sh"]