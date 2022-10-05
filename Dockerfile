FROM python:3.6-slim
MAINTAINER valsky_the_don
COPY . /dockerfun
WORKDIR /dockerfun
RUN apt-get update
RUN curl -sSL https://get.docker.com/ | sh
RUN docker run --rm -u root -p 8080:8080 -v jenkins-data:/var/jenkins_home -v $(which docker):/usr/bin/docker -v /var/run/docker.sock:/var/run/docker.sock -v "$HOME":/home jenkinsci/blueocean
RUN sudo docker build -t yourusername/jenkins .
RUN pip install --no-cache-dir -r requirements.txt
RUN ["pytest", "-v", "--junitxml=reports/result.xml"]
CMD tail -f /dev/null