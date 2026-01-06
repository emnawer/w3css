# Use a lightweight Node.js image (Alpine Linux)
FROM node:20-alpine

# Set working directory inside the container
WORKDIR /app

# 1. Install Dependencies
# We copy package files first to leverage caching
COPY package*.json ./
RUN npm install -g sass

# 2. Copy Source Code
# This copies your root w3.css, src folder, and everything else
COPY . .

# 3. Default Command
# Runs the build script which copies w3.css -> src/base/_legacy.scss and compiles
CMD ["npm", "run", "build"]