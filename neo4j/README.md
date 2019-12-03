Manage single node Neo4J in docker on local machines. 
* Guide https://neo4j.com/developer/docker-run-neo4j/

**Features**
* Creates named volumes to persist across restarts.  
* The Neo4J web UI is on http://localhost:7474

**Usage**
| command  | Purpose  |
|---|---|
| docker-compose up             | bring up services attached to the logs using existing images |
| docker-compose up -d --build  | bring up services detached building new imsages |
| docker-compose down           | bring down services  | 

**Purpose**
Exists as docker compose to make multi-node easier in future.