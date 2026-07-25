# Purpose
* Manage single node Neo4J in docker on local machines. 
* Exists as docker-compose even though this is single node to make multi-node easier in future.
* Guide: https://neo4j.com/developer/docker-run-neo4j/

# Features
* Login is `neo4j` / `test1234` (current neo4j images reject passwords under 8 characters, so the old 4-character password no longer starts the container).
* Creates named volumes to persist across restarts.  
* The Neo4J web UI is on http://localhost:7474
* Open shell command prompt with `docker exec -it neo4j /bin/bash`
    * This may not work from a GitHub Bash prompt on Windows

# Docker Management
See README.md in the [root of this repo](../README.md) for interesting docker commands.

# IDE Integration
No IDE integrations specific to this project are called out at this time.