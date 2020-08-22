# Purpose
* Manage 9 Kafka services with all CE parts in docker on local machines. 
* Exists as docker-compose to make multi-node easier .

## References
* Confluent with UI: https://docs.confluent.io/current/quickstart/ce-docker-quickstart.html
* Community without: UI https://docs.confluent.io/current/quickstart/cos-docker-quickstart.html
* Copied from: https://github.com/confluentinc/cp-all-in-one/
* You can find information about confluent images at https://docs.confluent.io/current/installation/docker/image-reference.html

# Features
* Creates named volumes to persist across restarts.  You have to remove the named volume to restore to original
* The Kafka / Confluent web UI is on http://localhost:9021/
* Recommends allocating 8GB of memory to Docker

## Jolokia
* Builds a docker container that includes the Jolokia agent to expose JMX over HTTP.
* cd into that directory
    * > cd jolokia
    * >build.sh
    * >docker-compose up
* Jolokia port 8778 is exposed to the host for demonstration http://localhost:8778/jolokia/list

# Docker Management
See README.md in the [root of this repo](../README.md)

# IDE Integration
No IDE integrations specific to this project are called out at this time.