#!/usr/bin/env bash
set -e

while ! mysqladmin ping -hmysql --silent; do
    echo "Waiting for mysql..."
    sleep 1
done
ant migrate-db

java -cp "lib/*" i5.las2peer.tools.L2pNodeLauncher -p 9011 -b reqbaz-backend:9011 uploadStartupDirectory startService\(\'de.rwth.dbis.acis.activitytracker.service.ActivityTrackerService@0.5.0\',\'Passphrase\'\) startWebConnector