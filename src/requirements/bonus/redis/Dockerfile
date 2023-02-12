FROM debian:buster

RUN apt-get update && apt-get install -y redis-server

COPY requirements/bonus/redis/conf/redis.conf /etc/redis/redis.conf

EXPOSE 6379

CMD ["redis-server", "--protected-mode", "no"]
