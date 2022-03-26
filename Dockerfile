FROM node:14-alpine as builder

WORKDIR /app

COPY package.json /app
COPY package-lock.json /app

RUN yarn install

COPY . /app
RUN yarn build

FROM nginx:latest
RUN rm -rf /etc/nginx/conf.d
RUN rm -rf /usr/share/nginx/html/*

COPY nginx /etc/nginx
COPY --from=builder /app/build /usr/share/nginx/html

EXPOSE 80
