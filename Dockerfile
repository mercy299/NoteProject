FROM python:3.8.10

#create working directory
WORKDIR /noted

#copy files to working directory
COPY . /noted

#set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1 

#install requirements and dependencies
RUN pip install --no-cache-dir -r requirements/production.txt \
    && apt update \
    && apt install -y wkhtmltopdf \
    && apt -y autoclean 

EXPOSE 8000

ENTRYPOINT [ "./entrypoint.sh" ]
