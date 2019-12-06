Manage single node MongoDB in docker on local machines. 
* Guide https://stackoverflow.com/questions/43162897/how-to-connect-to-mongodb-using-docker-compose/43163074

# Features
* Creates named volumes to persist across restarts.  You have to remove the named volume to restore to original
* The Mongo Express web UI is on http://localhost:8081
* The Mongo db connection string is mongodb://localhost:27017

# Usage
See README.md in the [root of this repo](../README.md)

# Purpose
Exists as docker compose to make multi-node easier in future.