# 1) Build stage: compile your React app
FROM node:18-alpine AS build
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# 2) Serve stage: install 'serve' and your Express health server
FROM node:18-alpine AS serve
WORKDIR /usr/src/app

# Install runtime deps
RUN npm install -g serve
COPY package*.json ./
RUN npm ci --only=production
# copy your build output
COPY --from=build /usr/src/app/build ./build
# copy the health.js server
COPY health.js ./

EXPOSE 8080

# Launch your Express health/server instead of 'serve'
CMD ["node", "health.js"]

USER appuser

CMD ["serve", "-s", "build", "-l", "8080"]
