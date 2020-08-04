FROM jfloff/alpine-python:2.7-slim
MAINTAINER ninjawulf98

WORKDIR /opt/autosub-master/
RUN apk update 
RUN wget https://github.com/BenjV/autosub/archive/master.zip 
RUN unzip master.zip -d /opt 
RUN rm master.zip 
RUN pip install Cheetah six

CMD ["python", "AutoSub.py", "--config=/opt/config/config.properties"]
EXPOSE 9960
