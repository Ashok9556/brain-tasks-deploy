FROM nginx:alpine

# Remove default Nginx static files
RUN rm -rf /usr/share/nginx/html/*

# Copy the built app
COPY dist/ /usr/share/nginx/html/

# Copy custom Nginx config (listens on 3000)
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 3000

CMD ["nginx", "-g", "daemon off;"]
