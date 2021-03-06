# Purpose
* Run continuum.io anaconda environment for Jupyter noteboks. 
* Exists as docker-compose even though this is single node to make multi-node easier in future.
* Guide: anaconda3 (python 3.x) https://hub.docker.com/r/continuumio/anaconda3

# Features
* Mounts named volume into `/opt/notebooks` to store files across restarts
* Mounts file share `~/Documents/GitHub` into `/opt/notebooks/GitHub`
* Creates named volumeto persist across restarts.  You have to remove the named volume to restore to original
* The Jupyter web server is located at http://localhost:8888/
    * The url with the secret token will show up in the logs of the window you started this with
* Open shell command prompt with `docker exec -it anaconda /bin/bash`
    * This may not work from a GitHub Bash prompt on Windows

# Docker Management
See README.md in the [root of this repo](../README.md) for interesting docker commands.

# IDE Integration
No IDE integrations specific to this project are called out at this time.