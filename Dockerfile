FROM python:3.9.0

WORKDIR /home/

RUN echo 'sdgdfzfdv'

RUN git clone -b master https://github.com/codeblue25/AI_school_django_personal_project.git

WORKDIR /home/AI_school_django_personal_project/

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient

EXPOSE 8000

CMD ["bash", "-c", "python manage.py collectstatic --noinput --settings=gis_1ban_2.settings.deploy && python manage.py migrate --settings=gis_1ban_2.settings.deploy && gunicorn --env DJANGO_SETTINGS_MODULE=gis_1ban_2.settings.deploy gis_1ban_2.wsgi --bind 0.0.0.0:8000"]