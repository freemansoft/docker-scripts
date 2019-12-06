# Purpose
* Manage single node Neo4J in docker on local machines. 
* Exists as docker-compose to make multi-node easier in future.
* Guide: https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DynamoDBLocal.UsageNotes.html

# Features
* Creates named volumes to persist across restarts.  You have to remove the named volume to restore to original
* DynamoDB is connected too using --endpoint-url http://localhost:8000
* The DynamoDB shell UI is on http://localhost:8000/shell/ 

# Docker Management
See README.md in the [root of this repo](../README.md)

# IDE Extension Recommendations
None at this time