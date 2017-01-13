#!/usr/bin/env python

import os
import time
import subprocess
from pymongo import MongoClient

mongoUrl = os.environ.get('MONGOURL', "mongodb://mongo:27017")
elasticsearch = os.environ.get('ELASTICSEARCH', "elasticsearch")
elasticport = os.environ.get('ELASTICPORT', 9200)

client = MongoClient('mongodb://localhost:27017')

while true:
    if client.database.command('isMaster')['ismaster']:
        print "Mongod node is now primary"
        break
    else:
        print "Waiting for Mongod node to assume primary status..."
        time.sleep(3)

time.sleep(1)

subprocess.call([
    'mongo-connector',
    '--auto-commit-interval=0',
    '--oplog-ts=/data/oplog.ts',
    '-m',
    mongoUrl,
    '-t',
    '%s:%s' % (elasticsearch, elasticport),
    '-d',
    'elastic2_doc_manager',
    '--stdout'
], shell=True)
