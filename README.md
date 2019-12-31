Simple compose scripts to bring up various open source or 3rd party on local docker.

# Available Containers/Images
| Product                                  | Distribution         | GUI container      | Memory Required |
|------------------------------------------|----------------------|--------------------|-----------------|
| [Anaconda](anaconda/README.md)           | continuum.io         | Jupyter notebook   | ??   |
| [DynamoDB](dynamodb/README.md)           | dyanmodb-local       | with web shell     | ??   |
| [Elasticsearch](elasticsearch/README.md) | Elastic.co           | Kibana             | ??   |
| [Kafka](kafka-confluent/README.md)       | Confluent.io CE with | KSQL Confluent GUI | 8GB  |
| [mongodb](mongodb/README.md)             | Mongo                | Mongo Express      | ??   |
| [neo4j](neo4j/README.md)                 | Neo4j.com            | built in console   | ??   |
| [redis](https://redis.io/)               | Redis                | Redis-Commander    | ??   |
| [Tensorflow](tensforflow/README.md)      | tensorflow.org       | w/Jupyter notebook | ??   |

# Using Docker
Open a command prompt.  Change pwd to the docker container directiory in this repository and execute one of the following commands.

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

# Opening a command line prompt on the VM hosting docker
Windows and Mac Docker desktop runs in a VM.  The named volumes are inside that VM. You can look at the named volumes in the MobyLinux VM that hosts the docker containers with teh following steps. 
* `docker container run --rm -it -v /:/host alpine`
* `chroot /host`
* `ls /var/lib/docker/volumes/`

This from [docker tips blog](https://nickjanetakis.com/blog/docker-tip-70-gain-access-to-the-mobylinux-vm-on-windows-or-macos). Works for Windows and Mac.

# IDE Integration

## Writing and deploying code for Jupyter Notebooks (anaconda) and Tensorflow
You can share a working / devleopment directory using the file share.
1. Enable file share for the correct drive using the _Docker --> Settings --> Shared Drive_ panel
1. Look in the docker-compose.yml files
    1. Uncomment the home directory Volumes line in docker-compose.yml
    1. Customize the line. Add any subdirectory path to the just un-commented Volumes entryf
1. Start the container
1. Open the IDE to the home directory you put in the docker-compose.yml file.

## Docker Management
The Docker plugin for Visual Studio Code supports opening a shell into the container from the docker control pane.
