#!/bin/sh

mkdir -p $WORLD_DIR
ln -sf $WORLD_DIR /server/world

original_items="variables.txt server.properties"
directories="config crash-reports logs"
json_items="whitelist.json ops.json banned-players.json banned-ips.json"

# Create default files if they don't exist in /server
for item in $json_items; do
  [ ! -e /server/$item ] && echo "[]" > /server/$item
done
# default dirs
[ ! -d /server/crash-reports ] && mkdir -p /server/crash-reports
[ ! -d /server/logs ] && mkdir -p /server/logs


# Join all items into a single list
all_items="$original_items $directories $json_items"

# Move existing files and directories from /server to /data if they don't already exist in /data
for item in $all_items; do
  if [ -e /server/$item ] && [ ! -e /data/$item ]; then
    mv /server/$item /data/$item
  fi
done

# Remove existing directories or files in /server that might interfere
for item in $all_items; do
  rm -rf /server/$item
done

# Create symbolic links in /server to files in /data
for item in $all_items; do
  ln -sf /data/$item /server/$item
done

echo "eula=$ACCEPT_EULA" > /server/eula.txt

cd /server
./start.sh

