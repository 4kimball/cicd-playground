FROM node:14-alpine as builder

WORKDIR /app

RUN yarn install
RUN yarn build

COPY ./ ./
EXPOSE 3000

CMD ["yarn", "start"]