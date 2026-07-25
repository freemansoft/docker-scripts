# Purpose
* Run tensorflow and Jupyter notebook server, probably continuum.io anaconda. 
* Exists as docker-compose even though this is single node to make multi-node easier in future.
* Guide: tensorflow https://hub.docker.com/r/tensorflow/tensorflow/

# Features
* Uses the `latest-jupyter` tag; the older `latest-py3-jupyter` tag no longer exists (Python 3 has been the only supported version for a while, so the `py3` qualifier was dropped).
* Mounts named volume into `/tf/notebooks` to store files across restarts
* Mounts file share `~/Documents/GitHub` into `/tf/notebooks/GitHub`
* The Jupyter web server is located at http://localhost:8888/
    * The url with the secret token will show up in the logs of the window you started this with
* Open shell command prompt with `docker exec -it tensorflow-jupyter /bin/bash`
    * This may not work from a GitHub Bash prompt on Windows

# Docker Management
See README.md in the [root of this repo](../README.md) for interesting docker commands.

# IDE Integration
No IDE integrations specific to this project are called out at this time.