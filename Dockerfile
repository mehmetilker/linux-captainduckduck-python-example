FROM ubuntu:latest
#FROM python:3.6-slim
RUN apt-get update -y
RUN apt-get install -y python-pip python-dev build-essential
RUN pip install --upgrade pip
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
#ENTRYPOINT ["python"]
#CMD ["app.py"]
CMD gunicorn --bind 0.0.0.0:5000 wsgi:fapp
#CMD ["python", "manage.py", "runserver", "0.0.0.0:80"]
