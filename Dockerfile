#Dockerfile

FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y

RUN apt-get install -y nginx git python3-setuptools python3-dev python3-pip

WORKDIR /usr/src

ADD djangotest/ /usr/src

RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*

RUN pip3 install django

WORKDIR mysite

EXPOSE 80 8080

CMD ["python3", "manage.py", "runserver", "0.0.0.0:80"]

