FROM python:3.6-slim
MAINTAINER valsky_the_don
COPY . /dockerfun
WORKDIR /dockerfun
RUN pip install --no-cache-dir -r requirements.txt
RUN ["pytest", "-v", "--junitxml=reports/result.xml"]
CMD tail -f /dev/null