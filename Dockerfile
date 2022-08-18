FROM ubuntu:latest
#bionic
ENV DEBIAN_FRONTEND=noninteractive

RUN mkdir /CODE

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python

RUN apt-get update
RUN apt-get -y install gdal-bin
RUN apt-get -y install libgdal-dev
RUN export CPLUS_INCLUDE_PATH=/usr/include/gdal
RUN export C_INCLUDE_PATH=/usr/include/gdal

COPY ./requirements_doker.txt /requirements_doker.txt

RUN pip install -r /requirements_doker.txt

