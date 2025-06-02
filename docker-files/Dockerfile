FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
CMD wget --no-verbose --spider http://localhost || exit 1
