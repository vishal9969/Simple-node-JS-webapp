# Use the Node.js 2.x image from the OpenShift ImageStream
FROM node:2

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and package-lock.json files first to optimize caching
COPY package.json package-lock.json /app/

# Install Node.js dependencies
RUN npm install

# Copy the rest of the application files into the container
COPY . /app/

# Expose port 8080 (or any other port your app listens on)
EXPOSE 8080

# Set the default command to start your application (assumes server.js is the entry point)
CMD ["node", "server.js"]
