# FROM debian:buster

# RUN apt update && apt install -y wget unzip python


# RUN wget --no-check-certificate https://html5up.net/paradigm-shift/download \
# 	&& unzip download && rm -rf download

# CMD ["python -m SimpleHTTPServer 3333"]

FROM debian:buster

RUN apt update && apt install -y wget unzip python3
WORKDIR /var/www/html
RUN wget --no-check-certificate https://html5up.net/paradigm-shift/download \
	&& unzip download && rm -rf download

CMD ["python3", "-m", "http.server", "0.0.0.0:3333"]