# 1) Use the official Node 18 LTS image to install deps & build.
FROM node:18-alpine AS build

WORKDIR /app
COPY package*.json ./
RUN npm ci

# If you have a build step (e.g. webpack, TS), uncomment:
# COPY tsconfig.json ./
# COPY src/ src/
# RUN npm run build

# 2) Final image: copy only what we need to run
FROM node:18-alpine AS runtime

WORKDIR /app
COPY --from=build /app/node_modules ./node_modules
COPY --from=build /app/package*.json ./
# If you build into dist/, uncomment:
# COPY --from=build /app/dist ./dist

# Expose your port if needed
EXPOSE 8080

# Default start command (adjust to your start script)
CMD ["npm", "start"]
