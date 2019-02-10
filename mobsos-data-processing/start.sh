#!/usr/bin/env bash
set -e

while ! mysqladmin ping -hmysql --silent; do
    echo "Waiting for mysql..."
    sleep 1
done
mysql -uroot -pmobsos -hmysql LAS2PEERMON < ./etc/create_database_MySQL.sql

java -cp "lib/*" i5.las2peer.tools.L2pNodeLauncher -p 9011 -s ./service/ uploadStartupDirectory startService\(\'i5.las2peer.services.mobsos.dataProcessing.MonitoringDataProcessingService@0.7.0\',\'processing\'\)