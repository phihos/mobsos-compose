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

EXPOSE 3000
CMD polymer serve --port 3000 --hostname 0.0.0.0