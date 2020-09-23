FROM python:3-alpine

ENV CACERT_PATH /

RUN apk --no-cache add build-base openldap-dev python2-dev python3-dev
RUN pip3 install python-ldap sqlalchemy requests

COPY templates ./templates
COPY api.py filedb.py syncer.py launcher.sh ./

RUN chmod u+x ./launcher.sh

VOLUME [ "/db" ]
VOLUME [ "/conf/dovecot" ]
VOLUME [ "/conf/sogo" ]

ENTRYPOINT [ "/bin/ash", "./launcher.sh" ]
