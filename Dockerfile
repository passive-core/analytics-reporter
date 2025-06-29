# 1) Build stage: compile your React app
FROM node:18-alpine AS build
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# 2) Serve stage: install 'serve' and publish the compiled static site
FROM node:18-alpine
WORKDIR /usr/src/app
RUN npm install -g serve
COPY --from=build /usr/src/app/build ./build
EXPOSE 8080
CMD ["serve", "-s", "build", "-l", "8080"]
