# Purpose
* Manage single node MongoDB in docker on local machines. 
* Exists as docker-compose even though this is single node to make multi-node easier in future.
* Guide: https://stackoverflow.com/questions/43162897/how-to-connect-to-mongodb-using-docker-compose/43163074

# Features
* Creates named volumes to persist across restarts.  You have to remove the named volume to restore to original
* The Mongo Express web UI is on http://localhost:8081
* The Mongo db connection string is mongodb://localhost:27017
* Open mongdb command prompt with `docker exec -it mongo01 mongo`

# Docker Management
See README.md in the [root of this repo](../README.md)

# IDE Extension Recommendations
* VSCode users can explore local Dynamo DB instances with their [Azure Cosmos DB extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-cosmosdb)