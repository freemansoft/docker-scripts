Manage single node Neo4J in docker on local machines. 
* Guide https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DynamoDBLocal.UsageNotes.html

**Features**
* Creates named volumes to persist across restarts.  You have to remove the named volume to restore to original
* DynamoDB is available on --endpoint-url http://localhost:8000
* The DynamoDB shell UI is on http://localhost:8000/shell/ 

**Usage**
| command  | Purpose  |
|---|---|
| docker-compose up             | bring up services attached to the logs using existing images |
| docker-compose up -d --build  | bring up services detached building new imsages |
| docker-compose down           | bring down services  | 

**Purpose**
Exists as docker compose to make multi-node easier in future.