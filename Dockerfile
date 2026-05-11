FROM nginx:alpine

# Copy site files
COPY index.html /usr/share/nginx/html/index.html
COPY public/ /usr/share/nginx/html/public/

# Custom nginx config for SPA-style routing and caching
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
