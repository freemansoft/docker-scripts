# Purpose
* Manage single node RabbitMQ in docker on local machines.
* Exists as docker-compose even though this is single node to make multi-node easier in future.
* Guide: https://hub.docker.com/_/rabbitmq

# Features
* Uses the `rabbitmq:management` image, which bundles the management UI plugin.
* Creates a named volume to persist queues/messages across restarts. You have to remove the named volume to restore to original.
* The RabbitMQ Management UI is located at http://localhost:15672/
    * Login with `admin` / `admin`
    * The built-in `guest`/`guest` account is not used because RabbitMQ only allows it to connect from localhost inside the container, which host-side clients (even via the mapped port) never are.
* The AMQP connection string is amqp://admin:admin@localhost:5672/
* Open shell command prompt with `docker exec -it rabbitmq /bin/bash`
    * This may not work from a GitHub Bash prompt on Windows

# Docker Management
See README.md in the [root of this repo](../README.md) for interesting docker commands.

# IDE Integration
No IDE integrations specific to this project are called out at this time.
