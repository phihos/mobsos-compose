FROM ubuntu:16.04

RUN apt-get update && apt-get install -y \
                      mysql-client \
                      ant \
                      openjdk-8-jdk

ADD repo /src
WORKDIR /src
RUN sed -i "s?databaseHost =.*?databaseHost = mysql?g" ./etc/i5.las2peer.services.mobsos.dataProcessing.MonitoringDataProcessingService.properties
RUN sed -i "s?databasePassword =.*?databasePassword = mobsos?g" ./etc/i5.las2peer.services.mobsos.dataProcessing.MonitoringDataProcessingService.properties
RUN ant jar

EXPOSE 9011
ADD start.sh /start.sh
CMD /start.sh