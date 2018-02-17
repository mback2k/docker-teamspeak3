#!/bin/sh
set -e

# link to data directories
ln -s /data/logs  /app/teamspeak3/logs
ln -s /data/files /app/teamspeak3/files

# link to license files
ln -s /data/licensekey.dat /app/teamspeak3/licensekey.dat
ln -s /data/serverkey.dat  /app/teamspeak3/serverkey.dat

exit 0
