> :warning:  Graph does not work. Feels like a networkng issue

# Purpose
* Manage _Datastax DSE / Cassandra_ server with _Graph_ enabled and the Datastax Studio. 
* Exists as docker-compose to make multi-node easier .

## References
* Datastax reference: https://docs.datastax.com/en/docker/doc/docker/docker67/dockerDSE.html
* Datastax sample repository: https://github.com/datastax/docker-images/tree/master/example_compose_yamls

# Instructions Start
## Manual Start
1. Create docker external network with `docker network create datastax`
1. Start the cluster with `docker-compose up`
1. Wait until it is started **You must see the complete message**
1. Connect your browser to the local studio UI http://localhost:9091/connections
1. Create a connection with _Menu --> Connections_
1. Create a connection called DSE.  
    1. The port is `9042` an
    1. The host is `dse`

## Script Start
1. `bash run.sh`

# Instructions Stop
## Manual Stop 
1. `ctrl-c`
1. `docker-compose down`
1. `docker network rm datastaz`

## Script Stop
1. `bash stop.sh`

# Features
* Creates named volumes for storage and notebooks to persist across restarts.  You have to remove the named volume to restore to original
* Exposes everything on localhost

# Docker Management
See README.md in the [root of this repo](../README.md)

# IDE Integration
No IDE integrations specific to this project are called out at this time.