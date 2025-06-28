# Use the official Node.js 18 image.
FROM node:18-alpine

# Create & switch to app directory
WORKDIR /usr/src/app

# Let Cloud Run choose the port
ENV PORT 8080

# Copy package manifests and install dependencies
COPY package*.json ./
RUN npm ci --only=production

# Copy the rest of your source
COPY . .

# Expose the port
EXPOSE $PORT

# Run the application
CMD ["node", "src/index.js"]
