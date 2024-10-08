FROM python:latest

WORKDIR /app

RUN apt-get update
RUN apt-get upgrade -y

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

EXPOSE 80

CMD [ "python3", "app.py" ]