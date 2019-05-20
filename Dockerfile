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
      bash \
    && npm install -g \
      serverless \
      serverless-domain-manager \
      serverless-aws-documentation

# Install aws-cli
RUN apk -Uuv add groff less python py-pip
RUN pip install awscli
RUN apk --purge -v del py-pip
RUN rm /var/cache/apk/*
