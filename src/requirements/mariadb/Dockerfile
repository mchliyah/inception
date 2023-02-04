FROM debian:buster

COPY .env .env

RUN apt-get update 
RUN apt-get install mariadb-server mariadb-client -y

RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld
RUN chmod 777 /var/run/mysqld
COPY requirements/tools/ tools/
COPY requirements/mariadb/srcs/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN	chmod +x tools/init.sh && \
	./tools/init.sh

EXPOSE 3306

CMD ["mysqld"]
