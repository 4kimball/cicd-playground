FROM node:14-alpine as builder

WORKDIR /app

COPY package.json .
COPY package-lock.json .

RUN yarn install

COPY . /app
RUN yarn build

FROM nginx:latest
RUN rm -rf /etc/nginx/conf.d
COPY ./default.conf /etc/nginx

COPY --from=builder /app /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]