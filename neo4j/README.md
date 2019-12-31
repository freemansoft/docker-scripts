# Purpose
* Manage single node Neo4J in docker on local machines. 
* Exists as docker-compose even though this is single node to make multi-node easier in future.
* Guide: https://neo4j.com/developer/docker-run-neo4j/

# Features
* Creates named volumes to persist across restarts.  
* The Neo4J web UI is on http://localhost:7474
* Open shell command prompt with `docker exec -it neo4j /bin/bash`
    * This may not work from a GitHub Bash prompt on Windows

# Docker Management
See README.md in the [root of this repo](../README.md) for interesting docker commands.

# IDE Integration
No IDE integrations specific to this project are called out at this time.