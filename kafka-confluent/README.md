Manage 9 Kafka services with all CE parts in docker on local machines. 
* Confluent with UI https://docs.confluent.io/current/quickstart/ce-docker-quickstart.html
* Community without UI https://docs.confluent.io/current/quickstart/cos-docker-quickstart.html

# Features
* Creates named volumes to persist across restarts.  You have to remove the named volume to restore to original
* The Kafka / Confluent web UI is on http://localhost:9021/
* Recommends allocating 8GB of memory to Docker

# Usage
See README.md in the [root of this repo](../README.md)


# Purpose
Exists as docker compose to make multi-node easier .
Copied from https://github.com/confluentinc/examples/tree/5.3.1-post/cp-all-in-one