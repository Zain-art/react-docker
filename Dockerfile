# Use the official Node.js image as a base image
FROM node:16-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json first for better caching
COPY package*.json ./


# Install dependencies
RUN npm install

# Copy the entire app to the container
COPY . .

# Build the React app
RUN npm run build

# Install a lightweight server to serve the app
RUN npm install -g serve

# Expose port 8080 on the host machine
EXPOSE 8080

# Command to run the app using serve
CMD ["serve", "-s", "build", "-l", "8080"]
