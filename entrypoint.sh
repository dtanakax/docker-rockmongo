#!/bin/sh
set -e

if [ "DB_REPLICA_NAME" = "" ]; then
    DB_PORT = false
fi

RM_FIRST=/firstrun

if [ ! -f $RM_FIRST ]; then
    # Configure RockMongo
    sed -i "s|DB_HOST|$DB_HOST|
            s/DB_PORT/$DB_PORT/
            s/DB_USER/$DB_USER/
            s/DB_PASSWORD/$DB_PASSWORD/
            s/DB_AUTH/$DB_AUTH/
            s/DB_REPLICA_NAME/$DB_REPLICA_NAME/g" /var/www/html/config.php
    touch $RM_FIRST
fi
