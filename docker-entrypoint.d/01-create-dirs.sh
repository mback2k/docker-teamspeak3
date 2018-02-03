#!/bin/sh
set -e

# create data directories
mkdir -p /data/logs
mkdir -p /data/files

# set permissions of data directories
chown -R teamspeak /data/logs
chown -R teamspeak /data/files
