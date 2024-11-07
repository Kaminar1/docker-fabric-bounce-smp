#!/bin/sh
# Create directories for external volumes if they don't exist
mkdir -p $WORLD_DIR
mkdir -p $CONFIG_DIR
mkdir -p $CRASH_REPORTS_DIR
mkdir -p $LOGS_DIR
[ ! -s $WHITELIST_FILE ] && echo "[]" > $WHITELIST_FILE
[ ! -s $OPS_FILE ] && echo "[]" $OPS_FILE
[ ! -s $BANNED_PLAYERS_FILE ] && echo "[]" > $BANNED_PLAYERS_FILE
[ ! -s $BANNED_IPS_FILE ] && echo "[]" > $BANNED_IPS_FILE
[ ! -s $SERVER_PROPERTIES_FILE ] && cp /server/server.properties $SERVER_PROPERTIES_FILE


ln -sf $WORLD_DIR /server/world
ln -sf $CONFIG_DIR /server/config
ln -sf $CRASH_REPORTS_DIR /server/crash-reports
ln -sf $LOGS_DIR /server/logs
ln -sf $WHITELIST_FILE /server/whitelist.json
ln -sf $OPS_FILE /server/ops.json
ln -sf $BANNED_PLAYERS_FILE /server/banned-players.json
ln -sf $BANNED_IPS_FILE /server/banned-ips.json
ln -sf $SERVER_PROPERTIES_FILE /server/server.properties

[ -f /server/variables.txt ] && mv /server/variables.txt /data/variables.txt
ln -sf /data/variables.txt /server/variables.txt


echo "eula=$ACCEPT_EULA" > /server/eula.txt

cd /server
./start.sh

