FROM tomsik68/xampp:latest

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y pip

COPY requirements.txt /backend

WORKDIR /backend

RUN pip install -r requirements.txt

# copy supervisor config file to start openssh-server
#COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf


CMD ["/usr/bin/supervisord", "-n"]