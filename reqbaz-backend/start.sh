#!/usr/bin/env bash
set -e

while ! mysqladmin ping -hmysql --silent; do
    echo "Waiting for mysql..."
    sleep 1
done
ant migrate-db
mysql -uroot -preqbaz -hmysql reqbaz < ./etc/migrations/add_reqbaz_demo_data_full.sql

while ! </dev/tcp/mobsos-data-processing/9011; do
    echo "Waiting for las2peer bootstrap..."
    sleep 1
done

java -cp "lib/*:service/*" i5.las2peer.tools.L2pNodeLauncher -p 9011 -b mobsos-data-processing:9011 uploadStartupDirectory --observer startService\(\'de.rwth.dbis.acis.bazaar.service.BazaarService@0.7.2\',\'Passphrase\'\) startWebConnector