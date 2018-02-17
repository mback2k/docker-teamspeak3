#!/bin/sh
set -e

# create data directories
mkdir -p /data/logs
mkdir -p /data/files

# set permissions of data directories
chown -R teamspeak3:teamspeak3 /data/logs
chown -R teamspeak3:teamspeak3 /data/files

exit 0
