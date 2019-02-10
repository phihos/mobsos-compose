#!/usr/bin/env bash
set -e

while ! mysqladmin ping -hmysql --silent; do
    echo "Waiting for mysql..."
    sleep 1
done
ant migrate-db

while ! </dev/tcp/mobsos-data-processing/9011; do
    echo "Waiting for las2peer bootstrap..."
    sleep 1
done

java -cp "lib/*:service/*" i5.las2peer.tools.L2pNodeLauncher -p 9011 -b mobsos-data-processing:9011 --observer uploadStartupDirectory startService\(\'de.rwth.dbis.acis.activitytracker.service.ActivityTrackerService@0.5.0\',\'Passphrase\'\) startWebConnector