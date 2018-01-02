#!/bin/bash

# First argument - ip or hostname of JDBC server

# update /etc/hosts
cp /etc/hosts ~/hosts.new
sed -i -- "s/localhost.localdomain/`hostname`/g" ~/hosts.new
cp -f ~/hosts.new /etc/hosts

# install MFT IS
cd /opt/mftis
mv /content/SilentInstall.xml .
mv /content/sqljdbc4.jar .
mv /content/keystore.jks .
sed -i -- "s/dockerhostname/`hostname`/g" SilentInstall.xml
sed -i -- "s/dockerjdbchost/$1/g" SilentInstall.xml
chmod +x /opt/mftis/install.sh
export JAVA_HOME=/opt/java/jdk1.8.0_131
export TERM=dumb
nohup ./install.sh silent &
sleep 120

# start service in background here
sed -i -- "s/Xms512m/Xms256m/g" /opt/mftis/server/bin/setenv.sh
sed -i -- "s/Xmx4096m/Xmx1024m/g" /opt/mftis/server/bin/setenv.sh 
nohup /opt/mftis/server/bin/startup.sh &
mv /content/start_mftis.sh /opt/mftis/server/bin/; chmod 755 /opt/mftis/server/bin/start_mftis.sh
mv /content/stop_mftis.sh /opt/mftis/server/bin/; chmod 755 /opt/mftis/server/bin/stop_mftis.sh
sleep 30