# Use an official Node.js runtime as a parent image.
# We're using the slim version to keep the image size small.
FROM node:18-slim

# Set the working directory inside the container.
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory.
# We do this first to leverage Docker's layer caching.
# If these files don't change, Docker won't re-run the npm install step.
COPY package*.json ./

# Install the dependencies.
RUN npm install

# Copy the rest of the application source code into the container.
COPY . .

# Expose the port the app runs on.
EXPOSE 3000

# Define the command to run the application.
# This is how Docker knows to start your app.
CMD [ "npm", "run", "start" ]