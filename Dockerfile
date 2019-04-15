ADD file:093f0723fa46f6cdbd6f7bd146448bb70ecce54254c35701feeceb956414622f in /
CMD ["/bin/sh"]
ENV ALPINE_VERSION=3.7
ENV PACKAGES=dumb-init PACKAGES=bash PACKAGES=ca-certificates PACKAGES=python2 PACKAGES=py-setuptools
RUN echo && echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" > /etc/apk/repositories && echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && apk add --no-cache $PACKAGES || (sed -i -e 's/dl-cdn/dl-4/g' /etc/apk/repositories && apk add --no-cache $PACKAGES) && echo "http://dl-cdn.alpinelinux.org/alpine/v$ALPINE_VERSION/main/" > /etc/apk/repositories && if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python2.7 /usr/bin/python; fi && if [[ ! -e /usr/bin/python-config ]]; then ln -sf /usr/bin/python2.7-config /usr/bin/python-config; fi && if [[ ! -e /usr/bin/easy_install ]]; then ln -sf /usr/bin/easy_install-2.7 /usr/bin/easy_install; fi && easy_install pip && pip install --upgrade pip && if [[ ! -e /usr/bin/pip ]]; then ln -sf /usr/bin/pip2.7 /usr/bin/pip; fi && echo
COPY file:27a6b1f2b3b182a99e0aa80e87d6c0f5b879159b5fec70eddf5db8254cb16e2e in /entrypoint.sh
ENV BUILD_PACKAGES=build-base BUILD_PACKAGES=linux-headers BUILD_PACKAGES=python2-dev
ENTRYPOINT ["/usr/bin/dumb-init" "bash" "/entrypoint.sh"]
LABEL maintainer=bamischijf
WORKDIR=/opt/autosub-master
RUN apk update && apk add gcc python-dev musl-dev && wget https://github.com/BenjV/autosub/archive/master.zip && unzip master.zip -d /opt && rm master.zip && easy_install Cheetah && apk del gcc python-dev musl-dev
CMD ["python" "AutoSub.py"]
EXPOSE 9960/tcp 