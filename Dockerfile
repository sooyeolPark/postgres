FROM postgres:15.4
LABEL authors="Park"

COPY ./init /docker-entrypoint-initdb.d
#권한을 주지 않으면 local로 떙겨오지 못함
RUN chmod -R 755 /docker-entrypoint-initdb.d
RUN chmod -R 755 /docker-entrypoint-initdb.d/init.sh
RUN chmod -R 755 /docker-entrypoint-initdb.d/init.sql

RUN chmod -R 755 /var/lib/postgresql/data