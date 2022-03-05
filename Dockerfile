FROM node:14-alpine as builder

RUN npm install -g serve

RUN mkdir /app
WORKDIR /app

RUN mkdir ./build
COPY ./build ./build

ENTRYPOINT ["serve", "-s", "build"]