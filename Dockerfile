# Name the node stage "builder"
FROM node:10 AS builder
# Set working directory
WORKDIR /app
# Copy all files from current directory to working dir in image
COPY . .
# install node modules and build assets
npm install -g @angular/cli@8.0.0
RUN npm install carbon-components carbon-components-angular @carbon/icons
RUN npm i && npm run build

# nginx state for serving content
FROM nginxinc/nginx-unprivileged
# Set working directory to nginx asset directory
WORKDIR /usr/share/nginx/html
# Remove default nginx static assets
# RUN rm -rf ./*
# Copy static assets from builder stage
COPY --from=builder /app/dist/AngularNew .
# Containers run nginx with global directives and daemon off
ENTRYPOINT ["nginx", "-g", "daemon off;"]
