FROM python:3.6-slim
MAINTAINER valsky_the_don
COPY . /dockerfun
WORKDIR /dockerfun
RUN apt-get update
RUN curl -sSL https://get.docker.com/ | sh
RUN sudo docker build -t yourusername/jenkins .
RUN sudo docker run -d -p9090:9090 -v /var/run/docker.sock:/var/run/docker.sock yourusername/jenkins
RUN pip install --no-cache-dir -r requirements.txt
RUN ["pytest", "-v", "--junitxml=reports/result.xml"]
CMD tail -f /dev/null