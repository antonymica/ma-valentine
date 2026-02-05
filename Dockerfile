FROM nginx:alpine
RUN sed -i 's/listen\(.*\)80;/listen 8080;/g' /etc/nginx/conf.d/default.conf
RUN touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid && \
    chown -R nginx:nginx /var/cache/nginx && \
    chown -R nginx:nginx /var/log/nginx && \
    chown -R nginx:nginx /etc/nginx/conf.d

RUN rm -rf /usr/share/nginx/html/*
COPY --chown=nginx:nginx index.html /usr/share/nginx/html/index.html
RUN chmod -R 555 /usr/share/nginx/html
EXPOSE 8080
USER nginx