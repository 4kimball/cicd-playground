FROM node:14-alpine as builder

WORKDIR /usr/src/app

COPY package.json .
COPY package-lock.json ./

RUN yarn

COPY ./ ./
RUN yarn build

FROM nginx:latest
COPY --from=builder /usr/src/app/build /usr/share/nginx/html

EXPOSE 80
