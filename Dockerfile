# Use official Node.js image from Docker Hub
FROM node:18

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json for npm install (only these to leverage Docker caching)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy all files from your local project to the Docker containers working directory
COPY . .

# Expose the port the app will run on 
EXPOSE 3000

# Command to run your app 
CMD ["npm", "start"]