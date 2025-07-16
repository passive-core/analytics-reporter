
FROM node:18-alpine AS build

WORKDIR /app
COPY package*.json ./
RUN npm ci

FROM node:18-alpine AS runtime

WORKDIR /app
COPY --from=build /app/node_modules ./node_modules
COPY --from=build /app/package*.json ./

EXPOSE 8080

CMD ["npm", "start"]
