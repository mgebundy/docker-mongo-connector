Mongo Connector (Elasticsearch 5)
===
Docker images for the mongo-connector.

Based on [`yeasy/docker-mongo-connector`](https://github.com/yeasy/docker-mongo-connector).

# Supported tags and respective Dockerfile links

* [`latest` (latest/Dockerfile)](https://github.com/mgebundy/docker-mongo-connector/blob/master/Dockerfile)

# What is docker-mongo-connector?
Docker image with mongo-connector installed. The image is built based on [Python 3.4.3](https://hub.docker.com/_/python/).

# How to use this image?
The docker image is auto built at [https://registry.hub.docker.com/u/mgebundy/mongo-connector/](https://registry.hub.docker.com/u/mgebundy/mongo-connector/).

## In Dockerfile
```sh
FROM mgebundy/mongo-connector:latest
```

## Local Run
By default, it will connect mongo node (`$MONGO` or the mongo host, on port `$MONGOPORT` or 27017) and elasticsearch node (`$ELASTICSEARCH` or the elasticsearch host, on port $ELASTICPORT or 9200).

Boot two containers with name mongo (config to cluster) and elasticsearch.
```sh
$ docker run -d --link=mongo:mongo --link=elasticsearch:elasticsearch mgebundy/mongo-connector
```

It will connect the two containers together to sync data between each other.

# Which image is based on?
The image is based on official `python:3.5.2`.

# What has been changed?

## Config TZ
Config timezone to Asia/Shanghai.

# Install mongo-connector
Install the mongo-connector[elastic5]
