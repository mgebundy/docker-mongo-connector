import os
import time
import subprocess
import json
from pymongo import MongoClient

configData = json.load(open('/data/config.json'))
mongoUrl = configData.get('mainAddress', os.environ.get('MONGOURL', "mongodb://mongodb:27017"))

client = MongoClient(mongoUrl)

print("Mongodb server at", mongoUrl)

while True:
    if client.database.command('isMaster')['ismaster']:
        print("Mongod node is now primary")
        break
    else:
        print("Waiting for Mongod node to assume primary status...")
        time.sleep(3)

time.sleep(1)

subprocess.call([
    'mongo-connector',
    '-c',
    '/data/config.json',
    '-m',
    mongoUrl,
    '--stdout'
])
