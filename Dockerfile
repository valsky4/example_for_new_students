FROM python:3.6-slim
MAINTAINER valsky_the_don
COPY . /dockerfun
WORKDIR /dockerfun
RUN apt-get update
RUN curl -sSL https://get.docker.com/ | sh
RUN docker run -u 0 --privileged --name jenkins -d -p 8080:8080 -p 50000:50000 -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):/usr/bin/docker -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts
RUN sudo docker build -t yourusername/jenkins .
RUN pip install --no-cache-dir -r requirements.txt
RUN ["pytest", "-v", "--junitxml=reports/result.xml"]
CMD tail -f /dev/null