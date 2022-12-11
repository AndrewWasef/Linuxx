##This file created by andrew wasef
FROM httpd:latest
copy ./test.html /usr/local/apache2/htdocs/
copy ./my-httpd.conf /usr/local/apache2/conf/httpd.conf
EXPOSE 9999
ENV CONTAINER docker
CMD echo $CONTAINER && httpd -D FOREGROUND

