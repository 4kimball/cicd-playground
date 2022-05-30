FROM node:14-alpine as builder

WORKDIR /usr/src/app

COPY package.json .
COPY package-lock.json ./

RUN yarn install

COPY ./ ./
RUN yarn build

CMD ["yarn", "start"]


