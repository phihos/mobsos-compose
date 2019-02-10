#!/usr/bin/env bash
set -e

while ! </dev/tcp/mobsos-data-processing/9011; do
    echo "Waiting for las2peer bootstrap..."
    sleep 1
done

java -cp "lib/*" i5.las2peer.tools.L2pNodeLauncher -p 9011 -b mobsos-data-processing:9011 --observer -s ./service/ startService\(\'i5.las2peer.services.fileService.FileService@2.2.5\',\'Passphrase\'\) startWebConnector