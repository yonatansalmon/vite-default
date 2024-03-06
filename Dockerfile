# Use an official lightweight Node.js image.
FROM node:14-slim

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of your app's source code
COPY . .

# Build your app
RUN npm run build

# Install serve to run your app
RUN npm install -g serve

# Command to run your app
CMD ["serve", "-s", "dist", "-l", "8080"]
