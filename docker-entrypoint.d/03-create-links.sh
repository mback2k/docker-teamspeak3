#!/bin/sh
set -e

# link to data directories
ln -sf /data/logs  /app/teamspeak3/logs
ln -sf /data/files /app/teamspeak3/files

# link to license files
ln -sf /data/licensekey.dat /app/teamspeak3/licensekey.dat
ln -sf /data/serverkey.dat  /app/teamspeak3/serverkey.dat

exit 0
