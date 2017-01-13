FROM python:3.4.3
MAINTAINER mgebundy@github

ENV DEBIAN_FRONTEND noninteractive
ENV TZ Asia/Shanghai

# Installing Mongo Connector which will connect MongoDB and Elasticsearch
RUN pip install 'mongo-connector[elastic5]'

COPY startup.sh /tmp/

COPY mongo /usr/bin/
RUN chmod a+x /usr/bin/mongo

VOLUME /data

# Sample usage when no commands is given outside
CMD ["/bin/bash", "/tmp/startup.sh"]
