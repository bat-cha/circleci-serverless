FROM node:10-alpine
LABEL maintainer="bat-cha <baptiste.chatrain@gmail.com>"

VOLUME ${HOME}/.aws
VOLUME /app
WORKDIR /app

RUN apk upgrade --update-cache --available \
    && apk update \
    && apk add --no-cache \
      ca-certificates \
    && npm install -g serverless
