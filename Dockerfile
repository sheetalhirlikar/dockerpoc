#Dockerfile

FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y

RUN apt-get install -y nginx git python3-setuptools python3-dev python3-pip python3-mysqldb default-libmysqlclient-dev build-essential 

WORKDIR /usr/src

ADD djangotest/ /usr/src

#RUN  apt-get update \
#  && apt-get install -y wget \
#  && rm -rf /var/lib/apt/lists/*

#RUN pip3 install -r requirements.txt
RUN pip3 install django

RUN pip3 install mysqlclient

RUN pip3 install djangorestframework

CMD ["python3", "manage.py", "startapp", "alr"]

WORKDIR mysite

EXPOSE 80 8080

CMD ["python3", "manage.py", "runserver", "0.0.0.0:80"]

