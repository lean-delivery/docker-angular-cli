FROM node:12.14-alpine as node-angular-cli

LABEL maintainer="team@lean-delivery.com"

#Linux setup
RUN apk update \
  && apk add --update alpine-sdk python make g++\
  && apk del alpine-sdk \
  && rm -rf /tmp/* /var/cache/apk/* *.tar.gz ~/.npm \
  && npm cache verify \
  && sed -i -e "s/bin\/ash/bin\/sh/" /etc/passwd

#Angular CLI
RUN npm install -g @angular/cli
