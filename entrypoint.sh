#!/bin/bash
set -e

if [ "$DB_REPLICA_NAME" != "" ]; then
    DB_PORT="false"
fi

if [ "$DB_AUTH" = "True" ]; then
    DB_AUTH="true"
else
    DB_AUTH="false"
fi

RM_FIRST=/firstrun

# Configure RockMongo
if [ ! -f $RM_FIRST ]; then
    sed -i "s/DB_NAME/$DB_NAME/
            s|DB_HOST|$DB_HOST|
            s/DB_PORT/$DB_PORT/
            s/DB_USER/$DB_USER/
            s/DB_PASSWORD/$DB_PASSWORD/
            s/DB_AUTH/$DB_AUTH/
            s/DB_REPLICA_NAME/$DB_REPLICA_NAME/g" /var/www/html/config.php
    touch $RM_FIRST
fi
