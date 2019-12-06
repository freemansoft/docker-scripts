Simple compose scripts to bring up various open source or 3rd party on local docker.

**Subdirectories**
| Product       | Distribution                    | Docker Memory Requirements |
|---------------|---------------------------------|----------------------------|
| Elasticsearch | Elastic.co with Kibana          | ??                         |
| Kafka         | Confluent.io Kafka CE with KSQL | 8GB                        |
| neo4j         | Neo4j.com                       | ??                         |
| mongodb       | Mongo with Mongo Express        | ??                         |

**Useful Commands**
| Command           | Purpose                     |
|---------------------------|------------------------------|
| docker stats              | show memory and other usage  |
| docker volume ls          | list persistent volumes      |
| docker volume rm <volume> | remove the persistent volume |
