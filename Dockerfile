FROM node:14-alpine AS deps

RUN apk add --no-cache libc6-compat
RUN npm ci && npm run build


FROM nginx:stable-alpine

WORKDIR /app

COPY ./dist .
COPY ./default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]