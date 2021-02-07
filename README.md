Simple compose scripts to bring up various open source or 3rd party on local docker.

# Available Containers/Images
| Product                                  | Distribution             | GUI container     | Min Memory | Local Mounts |
|------------------------------------------|--------------------------|-------------------|------------|--------------|
| [Anaconda](anaconda/README.md)           | continuum.io             | Jupyter notebook  | ??         | ~/Documents/GitHub |
| [Datastax](datastax/README.md)           | dse                      | DSE Studio        | 2GB/4GB ?  | -none |
| [Dask](dask/README.md)                   | https://dask.org/        | Dask Dashboard + Jupyter | ??  | ~/Documents/GitHub |
| [DynamoDB](dynamodb/README.md)           | dyanmodb-local           | with web shell    | ??         | -none- |
| [Elasticsearch](elasticsearch/README.md) | Elastic.co               | Kibana            | ??         | -none- |
| [Kaggle Docker](docker-python-kaggle/README.m|) | Kaggle            | Jupyter notebook  | 4GB        | $PWD   |
| [Kafka](kafka-confluent/README.md)       | Confluent.io CE with KSQL| Confluent GUI     | 8GB        | -none- |
| [mongodb](mongodb/README.md)             | Mongo                    | Mongo Express     | ??         | -none- |
| [neo4j](neo4j/README.md)                 | Neo4j.com                | built in console  | ??         | -none- |
| [portainer](portainer/README.md)         | Portainer.io             | Portainer UI      | ??         | -none- |
| [redis](https://redis.io/)               | Redis                    | Redis-Commander   | ??         | -none- |
| [Tensorflow](tensforflow/README.md)      | tensorflow.org           | Jupyter notebook  | ??         | ~/Documents/GitHub |
| [Tika](tika/README.md)                   | https://tika.apache.org/ | Text extraction   | ??         | -none- |

# Using Docker
Open a command prompt.  Change pwd to the docker container directiory in this repository and execute one of the following commands.

## Starting and stopping docker with docker-compose
| command                                         | cwd              | Purpose                                      |
|-------------------------------------------------|------------------|----------------------------------------------|
| `docker-compose up`                             | compose file dir |bring up service attached to logs             |
| `docker-compse -f <proj_dir>/<compos yml> up`   | project root     |bring up service attached to logs             |
| `docker-compose up -d --build`                  | compose file dir |bring up service detached building new imsages |
| `docker-compose down`                           | compose file dir |bring down service                            | 
| `docker-compse -f <proj_dir>/<compose_yml> down`| project root     |bring down service - run from repo root       | 

## Docker volume related commands
| Command                   | Purpose                      |
|---------------------------|------------------------------|
| `docker stats`              | show memory and other usage  |
| `docker volume ls`          | list persistent volumes      |
| `docker volume rm <volume>` | remove the persistent volume |

# Opening a command line prompt on the VM hosting docker
Windows and Mac Docker desktop runs in a VM.  The named volumes are inside that VM. You can look at the named volumes in the MobyLinux VM that hosts the docker containers with the following steps. 
* `docker container run --rm -it -v /:/host alpine`
* `chroot /host`
* `ls /var/lib/docker/volumes/`
This from [docker tips blog](https://nickjanetakis.com/blog/docker-tip-70-gain-access-to-the-mobylinux-vm-on-windows-or-macos). Works for Windows and Mac.

# Named Volumes
You will see some _redundancy_ in the actual names of the named volumes declared in _docker-compose.yml_ files. This is because docker-compose synthesizes the actual named volumen name. Docker prepends the directory docker-compose.yml directory name to the volume names specified in the docker-compose.yml files.  This means that a named volume, `dog_data` run from inside the mongodb directory takes on the name `mongdb_dog_data`.  

# IDE Integration
## Writing and deploying code for Jupyter Notebooks (anaconda) and Tensorflow
You can share a working / development directory using the file share.
1. Enable file share for the correct drive using the _Docker --> Settings --> Shared Drive_ panel
1. Look in the docker-compose.yml files
    1. Uncomment the home directory Volumes line in docker-compose.yml
    1. Customize the line. Add any subdirectory path to the just un-commented Volumes entryf
1. Start the container using `docker-compose`
1. Open the IDE to a directory inside the directory you put in the docker-compose.yml file.
From [Docker container tips](https://code.visualstudio.com/docs/remote/troubleshooting#_container-tips)

## Docker Management
The Docker plugin for Visual Studio Code supports container, volume and network management

## Shell prompts in a docker container
The Docker plugin for Visual Studio Code supports opening a shell into the container from the docker control pane.
