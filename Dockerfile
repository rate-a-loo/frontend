FROM node:latest AS build

WORKDIR /

COPY . ./
RUN npm install
RUN npm run build

FROM nginx:1.19-alpine
COPY --from=build /dist /usr/share/nginx/html