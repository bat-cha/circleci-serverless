FROM node:current-alpine
LABEL maintainer="bat-cha <baptiste.chatrain@gmail.com>"

VOLUME ${HOME}/.aws
VOLUME /app
WORKDIR /app

RUN apk upgrade --update-cache --available \
    && apk update \
    && apk add --no-cache \
      ca-certificates \
      git \
    && npm install -g \
      serverless \
      serverless-domain-manager \
      serverless-aws-documentation
