#!/bin/bash
set -e

if [ "$1" = "/bin/sh" ]; then
    _DB_REPLICA_NAME=" \"\""
    if [ "$DB_REPLICA_NAME" != "*None*" ]; then
        DB_PORT="false"
        _DB_REPLICA_NAME="array('replicaSet' => '$DB_REPLICA_NAME')"
    else
        DB_REPLICA_NAME=""
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
                s|DB_REPLICA_NAME|$_DB_REPLICA_NAME|g" /var/www/html/config.php

        touch $RM_FIRST
    fi
fi

exec "$@"
