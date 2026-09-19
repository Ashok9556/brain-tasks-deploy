FROM nginx:alpine

# Remove default Nginx static files
RUN rm -rf /usr/share/nginx/html/*

# Copy the pre-built app into Nginx's web root
COPY dist/ /usr/share/nginx/html/

# Custom Nginx config: listen on 3000, SPA fallback routing
RUN printf 'server {\n\
    listen 3000;\n\
    listen [::]:3000;\n\
    server_name _;\n\
    root /usr/share/nginx/html;\n\
    index index.html;\n\
    location / {\n\
        try_files $uri $uri/ /index.html;\n\
    }\n\
    location ~* \\.(?:js|css|png|jpg|jpeg|gif|svg|ico|woff2?)$ {\n\
        expires 7d;\n\
        add_header Cache-Control "public, immutable";\n\
    }\n\
}\n' > /etc/nginx/conf.d/default.conf

EXPOSE 3000

CMD ["nginx", "-g", "daemon off;"]
