FROM ubuntu:16.04

RUN apt-get update && apt-get install -y \
                      ant \
                      openjdk-8-jdk

ADD repo /src
WORKDIR /src
RUN ant all

EXPOSE 9011
CMD java -cp "lib/*:service/*" i5.las2peer.tools.L2pNodeLauncher -p 9011 -b reqbaz-backend:9011 startService\(\'i5.las2peer.services.fileService.FileService@2.2.5\',\'Passphrase\'\) startWebConnector