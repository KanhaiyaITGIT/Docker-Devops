FROM nginx:latest
COPY index.html /usr/share/nginx/html/
EXPOSE 80
LABEL maintainer="kanhaiya"
LABEL project="docker demo site"
HEALTHCHECK --interval=30s --timeout=30s --retries=3 \
  CMD curl -f http://localhost/ || exit 1

CMD echo "nginx server started successfully!" && nginx -g 'daemon off;'

