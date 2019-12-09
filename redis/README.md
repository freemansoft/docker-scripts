# Purpose
* Manage single node Redis in docker on local machines. 
* Exists as docker-compose even though this is single node to make multi-node easier in future.
* Guide: tbd

# Features
* Creates named volumes to persist across restarts.  You have to remove the named volume to restore to original
* The Redis Commander UI is located at http://localhost:8081/
* The Redis cache connection string is redis://localhost/

# Docker Management
See README.md in the [root of this repo](../README.md)

