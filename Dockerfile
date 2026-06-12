FROM httpd:2-alpine

COPY template/ /usr/local/apache2/htdocs/

EXPOSE 80

CMD ["httpd", "-D", "FOREGROUND"]
