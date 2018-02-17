#!/bin/sh
set -e

# check environment variable TEAMSPEAK3_APPDIR
if [ -z "${TEAMSPEAK3_APPDIR}" ]; then
    echo "Environment variable TEAMSPEAK3_APPDIR is required"
    exit 1
fi

# check environment variable TEAMSPEAK3_INIFILE
if [ -z "${TEAMSPEAK3_INIFILE}" ]; then
    echo "Environment variable TEAMSPEAK3_INIFILE is required"
    exit 2
fi

echo "#!/bin/sh" > /usr/local/bin/teamspeak3
echo "cd ${TEAMSPEAK3_APPDIR}" >> /usr/local/bin/teamspeak3
echo "export LD_LIBRARY_PATH=${TEAMSPEAK3_APPDIR}:${LD_LIBRARY_PATH}" >> /usr/local/bin/teamspeak3
echo "exec ${TEAMSPEAK3_APPDIR}/ts3server inifile=${TEAMSPEAK3_INIFILE}" >> /usr/local/bin/teamspeak3

chown --reference=${TEAMSPEAK3_APPDIR}/ts3server /usr/local/bin/teamspeak3
chmod --reference=${TEAMSPEAK3_APPDIR}/ts3server /usr/local/bin/teamspeak3

exit 0
