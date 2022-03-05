FROM node:14-alpine as builder

WORKDIR /app

COPY package.json .
COPY package-lock.json .

RUN yarn install

COPY ./ ./
EXPOSE 3000

CMD ["yarn", "start"]