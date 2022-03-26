FROM node:14-alpine as builder

WORKDIR /usr/src/app

COPY package.json .
COPY package-lock.json ./

RUN yarn install

COPY ./ ./
RUN yarn build

FROM nginx:latest
EXPOSE 80
RUN rm -rf /etc/nginx/conf.d
RUN rm -rf /usr/share/nginx/html/*

COPY nginx/conf.d /etc/nginx
COPY --from=builder /usr/src/app/build /usr/share/nginx/html


