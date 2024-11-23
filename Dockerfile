FROM node:21-alpine

WORKDIR /usr/src/app

COPY package.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD [ "npm" , "start" ]




# # Multistage Docker File:

# # First stage: Build the React app
# FROM node:18-alpine AS build

# # Set working directory
# WORKDIR /app

# # Copy package.json and package-lock.json to install dependencies
# COPY package*.json ./

# # Install dependencies
# RUN npm install

# # Copy the rest of the application code
# COPY . .

# # Build the app for production
# RUN npm run build

# # Second stage: Create a smaller image with Nginx to serve the static files
# FROM nginx:alpine

# # Copy built files from the first stage to Nginx's html directory
# COPY --from=build /app/build /usr/share/nginx/html

# # Expose port 80 to serve the app
# EXPOSE 80

# # Start Nginx server
# CMD ["nginx", "-g", "daemon off;"]