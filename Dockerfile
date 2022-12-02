# base image  
FROM python:3.9.13

# set python not to compile modules and flush buffers
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

ENV DockerHOME=/code
RUN mkdir -p $DockerHOME

#working dir in image
WORKDIR $DockerHOME

#copy requirements.txt file to working dir
COPY ./requirements.txt $DockerHOME
# and install them
RUN pip install -r ./requirements.txt

#copy all current dirs and files to working dir
COPY ./appgarage $DockerHOME
# releases port 8000 within the container, where the Django app will run
EXPOSE 8000

#run server
CMD python manage.py runserver 0.0.0.0:8000

