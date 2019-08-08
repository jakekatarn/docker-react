FROM node:alpine as builder
ENV http_proxy http://jm91722:JSM20190122;1@proxy.internal.epo.org:8080
ENV https_proxy http://jm91722:JSM20190122;1@proxy.internal.epo.org:8080
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
