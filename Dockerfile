FROM httpd:2-alpine
COPY ./build/web/ /usr/local/apache2/htdocs/