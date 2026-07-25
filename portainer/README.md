# Purpose
* Run https://www.portainer.io/ docker management dashboard
* Exists as docker-compose even though this is single node to make multi-node easier in future.
* Guide: portainer https://docs.portainer.io/start/install-ce/server/docker/linux

# Features
* Uses the `portainer-ce` image and the `lts` tag; the old `portainer/portainer` image (no `-ce` suffix) stopped receiving updates.
* Creates named volumes to persist across restarts. You have to remove the named volume to restore to original
* The admin UI is located at http://localhost:9000/
    * First-time setup now requires a **setup token**, not just picking a password on the page: run `docker logs portainer` and look for a line like `setup_token=<long hex string>`, then paste that into the setup screen's token field along with your chosen admin password
    * You will have to complete setup within a few minutes of first startup, or the initial setup window expires and you'll need to recreate the container to try again
    * The _edge agent_ port, 8000, is not exposed in this config
* Open shell command prompt with `docker exec -it portainer /bin/bash`
    * This may not work from a GitHub Bash prompt on Windows

# Docker Management
See README.md in the [root of this repo](../README.md) for interesting docker commands.

# IDE Integration
No IDE integrations specific to this project are called out at this time.