# Use the official Node.js 18 image.
FROM node:18-alpine

# Create & switch to app directory
WORKDIR /usr/src/app

# Copy package manifests and install dependencies
COPY package*.json ./
RUN npm ci --only=production

# Copy the rest of your source
COPY . .

# Expose your service’s port
EXPOSE 8080

# Run the built app
CMD ["node", "src/index.js"]
