FROM debian:stretch

MAINTAINER Mariusz Derela <mariusz.derela@ing.com>

ARG SUPERSET_VERSION=0.28.1

# Configure environment

ENV LANG=C.UTF-8 \ 
    LC_ALL=C.UTF-8 \ 
    PYTHONPATH=/etc/superset:/home/superset:$PYTHONPATH \ 
    SUPERSET_VERSION=${SUPERSET_VERSION} \ 
    SUPERSET_HOME=/var/lib/superset



RUN useradd -U -m superset && \
    mkdir /etc/superset && \
    mkdir ${SUPERSET_HOME} && \
    chown -R superset:superset /etc/superset && \ 
    chown -R superset:superset ${SUPERSET_HOME} && \
    apt-get update && \ 
    apt-get install -y \ 
	build-essential \ 
	curl \ 
	default-libmysqlclient-dev \ 
	libffi-dev \ 
	libldap2-dev \ 
	libpq-dev \ 
	libsasl2-dev \ 
	libssl-dev \ 
	openjdk-8-jdk \ 
	python-dev \ 
	python-pip && \ 
	apt-get clean && \
        rm -r /var/lib/apt/lists/* && \
        pip install --no-cache-dir \
          flask-cors \
          flask-mail \
          flask-oauth \
          flask-ldap==0.1.6 \
          flask-ldapconn==0.6.12 \
          bleach==2.1.2 \
          boto3==1.4.7 \
          celery==4.1.0 \
          colorama==0.3.9 \
          cryptography==1.9 \
          flask==0.12.2 \
          flask-appbuilder==1.10.0 \
          flask-cache==0.13.1 \
          flask-compress==1.4.0 \
          flask-migrate==2.1.1 \
          flask-script==2.0.6 \
          flask-sqlalchemy==2.1 \
          flask-testing==0.7.1 \
          flask-wtf==0.14.2 \
          flower==0.9.2 \
          future==0.16.0 \
          geopy==1.11.0 \
          gunicorn==19.7.1 \
          humanize==0.5.1 \
          idna==2.6 \
          markdown==2.6.11 \
          pandas==0.22.0 \
          parsedatetime==2.0.0 \
          pathlib2==2.3.0 \
          polyline==1.3.2 \
          pydruid==0.4.1 \
          pyhive==0.5.0 \
          python-dateutil==2.6.1 \
          python-geohash==0.8.5 \
          pyyaml==3.12 \
          requests==2.18.4 \
          simplejson==3.13.2 \
          six==1.11.0 \
          sqlalchemy==1.2.2 \
          sqlalchemy-utils==0.32.21 \
          sqlparse==0.2.4 \
          thrift==0.11.0 \
          thrift-sasl==0.3.0 \
          unicodecsv==0.14.1 \
          unidecode==1.0.22 \
          pyldap==2.4.28 \
          mysqlclient \
          python-ldap==2.4.28 \
          redis==2.10.5 \
          gevent==1.2.2 \
          impyla==0.14.0 \
          Werkzeug==0.12.1 \
          superset==${SUPERSET_VERSION} 


EXPOSE 8088
ENTRYPOINT ["superset"]
CMD ["runserver"]
USER superset
