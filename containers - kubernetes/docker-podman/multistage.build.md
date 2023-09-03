# MultiStage Builds

## Key Topics
- Reduce image size
- Enhance security
- Streamline the build process

## Example
Here's a sample of a node js multistage build image with a serving nginx http daemon on port 80
```dockerfile
# Stage 1: Build the application
FROM node:14 AS build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Create the production image
FROM nginx:latest
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```
