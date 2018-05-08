FROM golang:alpine
LABEL maintainer="bat-cha <baptiste.chatrain@gmail.com>"

VOLUME ${HOME}/.aws
VOLUME /app
WORKDIR /app

RUN apk upgrade --update-cache --available \
    && apk update \
    && apk add --no-cache \
      ca-certificates \
      bash \
      git \
      make \
      curl \
      nodejs \
      nodejs-npm \
      build-base \
    && npm install -g serverless \
    && curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh \
    && go get -u github.com/jstemmer/go-junit-report \
    && go get -u golang.org/x/lint/golint \
    && curl -L https://codeclimate.com/downloads/test-reporter/test-reporter-latest-linux-amd64 > /bin/cc-test-reporter \
    && chmod +x /bin/cc-test-reporter




