Simple compose scripts to bring up various open source or 3rd party on local docker.

# Available Containers/Images
| Product       | Distribution                    | Docker Memory Requirements |
|---------------|---------------------------------|----------------------------|
| [DynamoDB](dynamodb/README.md)            | dyanmodb-local with web shell   | ??                         |
| [Elasticsearch](elasticsearch/README.md)  | Elastic.co with Kibana          | ??                         |
| [Kafka](kafka-confluent/README.md)        | Confluent.io Kafka CE with KSQL | 8GB                        |
| [mongodb](mongodb/README.md)              | Mongo with Mongo Express        | ??                         |
| [neo4j](neo4j/README.md)                  | Neo4j.com                       | ??                         |

# Using Docker
Open a command prompt.  Change pwd to the docker container set you want to run and execute one of the following commands.

## Starting and stopping docker with docker-compose
| command                       | Purpose                                                      |
|-------------------------------|--------------------------------------------------------------|
| `docker-compose up`             | bring up services attached to the logs using existing images |
| `docker-compose up -d --build`  | bring up services detached building new imsages              |
| `docker-compose down`           | bring down services                                          | 

## docker volume related commands
| Command                   | Purpose                      |
|---------------------------|------------------------------|
| `docker stats`              | show memory and other usage  |
| `docker volume ls`          | list persistent volumes      |
| `docker volume rm <volume>` | remove the persistent volume |
