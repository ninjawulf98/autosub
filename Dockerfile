FROM jfloff/alpine-python:2.7-slim
MAINTAINER bamischijf

WORKDIR /opt/autosub-master/
RUN apk update 
RUN wget https://github.com/BenjV/autosub/archive/master.zip 
RUN unzip master.zip -d /opt 
RUN rm master.zip 
RUN pip install Cheetah six

CMD ["python", "AutoSub.py"]
EXPOSE 9960