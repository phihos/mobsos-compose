FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
                      npm \
                      git

ADD repo /src
WORKDIR /src
RUN rm -rf .git
RUN npm install --global polymer-cli bower
RUN npm install
RUN bower install --allow-root

# Config
RUN sed -i "s?        value: 'https://requirements-bazaar.org/bazaar/'?        value: 'http://localhost:8080/bazaar/'?g" ./src/config-behavior.html
RUN sed -i "s?        value: 'https://requirements-bazaar.org/activities'?        value: 'http://localhost:8080/activities'?g" ./src/config-behavior.html

EXPOSE 3000
CMD polymer serve --port 8081 --hostname 0.0.0.0