Manage 9 Kafka services with all CE parts in docker on local machines. 
* Confluent with UI https://docs.confluent.io/current/quickstart/ce-docker-quickstart.html
* Community without UI https://docs.confluent.io/current/quickstart/cos-docker-quickstart.html

**Features**
* The Kafka / Confluent web UI is on http://localhost:9021/
* Recommends 8gb

**Usage**
| command  | Purpose  |
|---|---|
| docker-compose up             | bring up services attached to the logs using existing images |
| docker-compose up -d --build  | bring up services detached building new imsages |
| docker-compose down           | bring down services  | 

**Purpose**
Exists as docker compose to make multi-node easier .
Copied from https://github.com/confluentinc/examples/tree/5.3.1-post/cp-all-in-one