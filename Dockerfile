FROM python:3.6-slim
#Change pod time zone
RUN rm -f /etc/localtime
RUN ln -s /usr/share/zoneinfo/Europe/Sofia /etc/localtime
MAINTAINER valentinstoyanov474@gmail.com
COPY . /dockerfun
WORKDIR /dockerfun
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install docker-compose
RUN ["pytest", "-n", "auto", "-v"]
#CMD tail -f /dev/null
