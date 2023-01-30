FROM debian:buster

RUN apt-get update 
RUN apt-get install -y mariadb-server sudo

COPY requirements/tools/ tools/
COPY .env .env
COPY requirements/mariadb/srcs/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN	chmod +x tools/init.sh && \
	./tools/init.sh

EXPOSE 3306

CMD ["mysqld"]
