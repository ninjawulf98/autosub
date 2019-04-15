FROM jfloff/alpine-python:2.7-slim
MAINTAINER bamischijf

WORKDIR /opt/autosub-master/
RUN apk update 
RUN apk apk add gcc python-dev musl-dev 
RUN wget https://github.com/BenjV/autosub/archive/master.zip 
RUN unzip master.zip -d /opt 
RUN rm master.zip 
RUN pip install Cheetah six
RUN apk del gcc python-dev musl-dev

CMD ["python", "AutoSub.py"]
EXPOSE 9960