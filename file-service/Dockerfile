FROM ubuntu:16.04

RUN apt-get update && apt-get install -y \
                      ant \
                      openjdk-8-jdk

ADD repo /src
WORKDIR /src
RUN ant all

EXPOSE 9011
ADD start.sh /start.sh
CMD /start.sh