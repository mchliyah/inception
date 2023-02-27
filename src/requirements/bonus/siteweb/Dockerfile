FROM debian:buster

RUN apt update && apt install -y wget unzip python3

RUN wget --no-check-certificate https://html5up.net/paradigm-shift/download \
	&& unzip download && rm -rf download
CMD ["python -m SimpleHTTPServer 3333"]