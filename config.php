<?php
/**
 * RockMongo configuration
 *
 * Defining default options and server configuration
 * @package rockmongo
 */
 
$MONGO = array();
$MONGO["features"]["log_query"] = "on";//log queries
$MONGO["features"]["theme"] = "default";//theme
$MONGO["features"]["plugins"] = "on";//plugins

$i = 0;

/**
* Configuration of MongoDB servers
* 
* @see more details at http://rockmongo.com/wiki/configuration?lang=en_us
*/
$MONGO["servers"][$i]["mongo_name"] = "DB_HOST";//mongo server name
//$MONGO["servers"][$i]["mongo_sock"] = "/var/run/mongo.sock";//mongo socket path (instead of host and port)
$MONGO["servers"][$i]["mongo_host"] = "DB_HOST";//mongo host
$MONGO["servers"][$i]["mongo_port"] = DB_PORT;//mongo port
$MONGO["servers"][$i]["mongo_options"] = array('replicaSet' => 'DB_REPLICA_NAME');
$MONGO["servers"][$i]["mongo_timeout"] = 0;//mongo connection timeout
//$MONGO["servers"][$i]["mongo_db"] = "MONGO_DATABASE";//default mongo db to connect, works only if mongo_auth=false
$MONGO["servers"][$i]["mongo_user"] = "DB_USER";//mongo authentication user name, works only if mongo_auth=false
$MONGO["servers"][$i]["mongo_pass"] = "DB_PASSWORD";//mongo authentication password, works only if mongo_auth=false
$MONGO["servers"][$i]["mongo_auth"] = DB_AUTH;//enable mongo authentication?

$MONGO["servers"][$i]["control_auth"] = true;//enable control users, works only if mongo_auth=false
$MONGO["servers"][$i]["control_users"]["DB_USER"] = "DB_PASSWORD";//one of control users ["USERNAME"]=PASSWORD, works only if mongo_auth=false

$MONGO["servers"][$i]["ui_only_dbs"] = "";//databases to display
$MONGO["servers"][$i]["ui_hide_dbs"] = "";//databases to hide
$MONGO["servers"][$i]["ui_hide_collections"] = "";//collections to hide
$MONGO["servers"][$i]["ui_hide_system_collections"] = false;//whether hide the system collections

?>