# Use the official Node.js image.
# https://hub.docker.com/_/node
FROM alpine:3.12

# Install dependencies
RUN apk update && apk add --no-cache nodejs npm

# Create and change to the app directory.
WORKDIR /app

# Install dependencies.
RUN npm install

# Copy local code to the container image.
COPY . .

# Run the web service on container startup.
CMD [ "node", "app.js" ]

# Inform Docker that the container listens on the specified port.
EXPOSE 3000