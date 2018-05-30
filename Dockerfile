FROM python:3.6.5
MAINTAINER mgebundy@github

ENV DEBIAN_FRONTEND noninteractive
ENV TZ Asia/Shanghai

# Installing Mongo Connector which will connect MongoDB and Elasticsearch
RUN pip install 'mongo-connector[elastic5]'
RUN pip install pymongo==3.5.1

COPY config.json /data/
COPY startup.py /tmp/

VOLUME /data

# Sample usage when no commands is given outside
CMD ["python", "-u", "/tmp/startup.py"]
