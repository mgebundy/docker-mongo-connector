FROM python:3.5.2
MAINTAINER mgebundy@github

ENV DEBIAN_FRONTEND noninteractive
ENV TZ Asia/Shanghai

# Installing Mongo Connector which will connect MongoDB and Elasticsearch
RUN pip install 'mongo-connector[elastic5]'
RUN pip install pymongo==3.4.0

COPY startup.py /tmp/

# COPY mongo /usr/bin/
# RUN chmod a+x /usr/bin/mongo

VOLUME /data

# Sample usage when no commands is given outside
CMD ["/usr/bin/env python", "/tmp/startup.py"]
