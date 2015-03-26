#!/bin/sh
set -e

DB_HOST=${DB_HOST:-""}
DB_PORT=${DB_PORT:-27017}
DB_USER=${DB_USER:-"admin"}
DB_PASSWORD=${DB_PASSWORD:-"admin"}
DB_AUTH=${DB_AUTH:-true}
DB_REPLICA_NAME=${DB_REPLICA_NAME:-""}

if [ "REPLICA_NAME" = "" ]; then
    DB_PORT = false
fi

# Configure RockMongo
sed -i "s|DB_HOST|$DB_HOST|
        s/DB_PORT/$DB_PORT/
        s/DB_USER/$DB_USER/
        s/DB_PASSWORD/$DB_PASSWORD/
        s/DB_AUTH/$DB_AUTH/
        s/DB_REPLICA_NAME/$DB_REPLICA_NAME/g" /var/www/html/config.php