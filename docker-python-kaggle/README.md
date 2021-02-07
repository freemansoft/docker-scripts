Kaggle provides a Docker Image that people can use as part of their Kaggle events.  This container is stuffed with libraries and components that make this an _uber python container_.  The amazing Kaagle Docker image is located at.  Beware. The Kaggle docker images contains a lot pieces. 

| CPU Image size on disk (2021) | GPU Image size on disk (2021) |
| -- | -- |
| **18GB** | **33GB** | 

The Kaggle docker repository for the python container can be found at  https://github.com/Kaggle/docker-python

## Prep
1. Your current working directory on the host where you type this command will be mounted into the container as a notebook direcory
1. cd to a directory where you want your notebooks stored.  It will be mounted into the container.
1. Set your Docker memory settings to be above 4GB, possibly 8gb depending on your data.  
    * The default Mac docker size is 2GB as of 2020.  
    * Windows WSL 2 allocates 1/2 of total memory for docker by default.

# Start the docker container and the Jupyter Notebook server with one command
The Kaggle image includes a jupyter startup script `run_jupyter.sh` that makes it easy to start the container and the notebook server

## Start the docker image on 8080 to use the Kaagle provided run_jupyter.sh
| CPU Image | NVIDA GPU image |
| --- | --- |
| `docker run --rm -it -v $PWD:/home/jupyter -p 8080:8080 --env NOTEBOOK_DISABLE_ROOT=true gcr.io/kaggle-images/python /run_jupyter.sh`| `docker run --runtime nvidia --rm -it -v $PWD:/home/jupyter -p 8080:8080 --env NOTEBOOK_DISABLE_ROOT=true gcr.io/kaggle-gpu-images/python /run/run_jupyter.sh` |

## Attach browser to notebook server
* http://localhost:8080/

### Notes
* Did not set specific working directory `-w /home/jupyter` because we mounted our directory into it.
* Files created by the Jupyter notebook will be owned by you **not** `root`
* No token is needed to access the notebook server.
* This starts the Jupyter notebook on 8080 not 8888

## stop the container 
`ctrl-c` the terminal window to terminate the container

# Manually Start the docker container and notebooks server
## Start the docker container on 8888 with interactive prompt
| CPU Image | NVIDA GPU image |
| --- | --- |
| `docker run --rm -it -v $PWD:/home/jupyter -p 8888:8888 gcr.io/kaggle-images/python /bin/bash` | `docker run --runtime nvidia --rm -it -v $PWD:/home/jupyter -p 8888:8888 gcr.io/kaggle-gpu-images/python /bin/bash` |

### Notes
* Did not set specific working directory `-w /home/jupyter` because we mounted our directory into it.
* Files created by the Jupyter notebook will be owned by `root`
* We start the container on shared port 8888 because that is the jupyter notebook default port

## Starting the jupyter notebook server when on container with prompt 
Your terminal will be logged into the container after the previous step. 
* `jupyter notebook --no-browser --ip="*" --allow-root --notebook-dir=/home/jupyter`

Notes
* You will need the token that shows up in the startup logs

## Starting the jupyter notebook server when on container with prompt 
Your terminal will be logged into the container after the previous step.  Launch the Jupyter notebook server with the following commands.
* http://localhost:8888/


## stop the container 
`ctrl-c` the terminal window to terminate the container

# Sample Notebooks
No particular order or suitability.  Just picked them because they worked for me.
* Geopandas tutorial
    * wget https://github.com/sedelmeyer/geopandas-tutorial/raw/master/geopandas-tutorial.ipynb
* https://www.kaggle.com/bono1020/tensorboard-tutorial
* https://github.com/DerwenAI/ibm_dsc_articles/
