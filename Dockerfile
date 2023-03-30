FROM python:3.8.10

#create working directory
WORKDIR /noted

#copy files to working directory
COPY . /noted

#set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1 

#install requirements and dependencies
RUN pip install -r requirements/production.txt \
    && apt-get update \
    && apt-get -y install wkhtmltopdf \
    && apt-get -y autoclean \

