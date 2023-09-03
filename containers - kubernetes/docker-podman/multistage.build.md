# MultiStage Builds

## Key Topics
- Reduce image size
- Enhance security
- Streamline the build process

## Example
### Docker multistage build
Here's a sample of a node.js multistage build image with a serving nginx http daemon on port 80
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

### distroless image
More or less the same as above with a nice distroless feature, even more compact in this case,
these are called distroless due to the fact these containers provide the bare minimum to get your
application up and running
```yaml
# Use the Go builder image to build the application
FROM golang:1.16 AS builder
WORKDIR /app
COPY main.go .
RUN CGO_ENABLED=0 GOOS=linux go build -o myapp main.go

# Create a Distroless image for the application
FROM gcr.io/distroless/static:nonroot
COPY --from=builder /app/myapp /
CMD ["/myapp"]
```
