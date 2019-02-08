FROM ubuntu:16.04

RUN apt-get update && apt-get install -y \
                      mysql-client \
                      ant \
                      openjdk-8-jdk

ADD repo /src
WORKDIR /src
RUN sed -i "s?dbUrl=.*?dbUrl=jdbc:mysql://mysql:3306/reqbaztrack?g" ./etc/de.rwth.dbis.acis.activitytracker.service.ActivityTrackerService.properties
RUN sed -i "s?BAZAAR_LANG?en?" ./etc/de.rwth.dbis.acis.activitytracker.service.ActivityTrackerService.properties
RUN sed -i "s?BAZAAR_COUNTRY?us?" ./etc/de.rwth.dbis.acis.activitytracker.service.ActivityTrackerService.properties
RUN ant all

EXPOSE 9011
EXPOSE 8080
ADD start.sh /start.sh
CMD /start.sh