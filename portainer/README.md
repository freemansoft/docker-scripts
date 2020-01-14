# Purpose
* Run https://www.portainer.io/ docker management dashboard
* Exists as docker-compose even though this is single node to make multi-node easier in future.
* Guide: portainer https://hub.docker.com/r/portainer/portainer

# Features
* Creates named volumes to persist across restarts. You have to remove the named volume to restore to original
* The admin UI is located at http://localhost:9000/
    * You will have to set the admin password the first time you access the ui
    * The _edge agent_ port, 8000, is not exposed in this config
* Open shell command prompt with `docker exec -it portainer /bin/bash`
    * This may not work from a GitHub Bash prompt on Windows

# Docker Management
See README.md in the [root of this repo](../README.md) for interesting docker commands.

# IDE Integration
No IDE integrations specific to this project are called out at this time.