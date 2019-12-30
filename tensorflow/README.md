# Purpose
* Run tensorflow and Jupyter notebook server, probably continuum.io anaconda. 
* Exists as docker-compose even though this is single node to make multi-node easier in future.
* Guide: tensorflow (python 3.x) https://hub.docker.com/r/tensorflow/tensorflow/

# Features
* Creates named volumes to persist across restarts.  You have to remove the named volume to restore to original
* The Jupyter web server is located at http://localhost:8888/
    * The url with the secret token will show up in the logs of the window you started this with
* Open anaconda command prompt with `docker run -i -t tensorflow/tensorflow:latest-py3-jupyter /bin/bash`
    * This may not work from a GitHub Bash prompt on Windows

# Docker Management
See README.md in the [root of this repo](../README.md)
