FROM tomsik68/xampp:latest

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install python3 libexpat1 python3-dev -y
RUN apt-get install -y pip
RUN apt-get install apache2 apache2-utils ssl-cert libapache2-mod-wsgi-py3 -y

WORKDIR /backend

#RUN pip install -r requirements.txt

# copy supervisor config file to start openssh-server
#COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf


CMD ["/usr/bin/supervisord", "-n"]