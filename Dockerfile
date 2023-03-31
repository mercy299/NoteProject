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
    && sudo apt-get update \
    && sudo apt-get upgrade \
    && sudo apt-get update && sudo apt-get install -y wkhtmltopdf \
    && sudo apt-get -y autoclean \

#install python
RUN cd /noted

#install postgres db
RUN sudo apt install postgresql postgresql-contrib

RUN apt install python3-pip
    pip install pipenv
    sudo apt install pipenv
    sudo apt install python3-dev libpq-dev

#install pyscopg2
RUN pip install psycopg2-binary
    pip install psycopg2

# Install django framwork
RUN pipenv install django