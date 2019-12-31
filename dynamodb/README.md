# Purpose
* Manage single node Neo4J in docker on local machines. 
* Exists as docker-compose to make multi-node easier in future.
* Guide: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DynamoDBLocal.UsageNotes.html

# Features
* Creates named volumes to persist across restarts.  You have to remove the named volume to restore to original
* DynamoDB is connected too using --endpoint-url http://localhost:8000
* The DynamoDB shell UI is on http://localhost:8000/shell/ 
* Open shell command prompt with `docker exec -it dynamodb /bin/bash`
    * This may not work from a GitHub Bash prompt on Windows

# Docker Management
See README.md in the [root of this repo](../README.md) for interesting docker commands.

# IDE Integration
No IDE integrations specific to this project are called out at this time.