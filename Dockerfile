FROM  ubuntu
ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update -y
RUN apt-get install curl nano net-tools apache2 php libapache2-mod-php stress -y
#RUN sed -i -e '/^Listen 80/s/^.*$/Listen 443/' /etc/apache2/ports.conf
ADD website /var/www/html/
RUN rm -f /var/www/html/index.html
EXPOSE 80
CMD apache2ctl -DFOREGROUND
