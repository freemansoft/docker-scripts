This is built on top of the Kaggle docker image which is an **18GB**

https://github.com/Kaggle/docker-python

## Prep
cd to a directory where you want your notebooks stored.  It will be mounted into the container.

## Start the docker image on 8888 with manual start
Do not need to set working directory `-w /home/jupyter` because we mounted our directory into it.
| CPU Image | NVIDA GPU image |
| --- | --- |
|`docker run --rm -it -v $PWD:/home/jupyter -p 8888:8888 gcr.io/kaggle-images/python /bin/bash`|`docker run --runtime nvidia --rm -it -v $PWD:/home/jupyter -p 8888:8888 gcr.io/kaggle-images/python /bin/bash`

### Start the jupyter notebook server
Files created by the Jupyter notebook will be owned by `root`
| Command | Web URL |
| ------- | ------- |
|`jupyter notebook --no-browser --ip="*" --allow-root --notebook-dir=/home/jupyter`|  http://localhost:8888/|
You will need the token that shows up in the startup logs

## Start the docker image on 8080 to use the run_jupyter.sh
Do not need to set working directory `-w /home/jupyter` because we mounted our directory into it.
| CPU Image | NVIDA GPU image |
| --- | --- |
|`docker run --rm -it -v $PWD:/home/jupyter -p 8080:8080 gcr.io/kaggle-images/python /bin/bash`|`docker run --runtime nvidia --rm -it -v $PWD:/home/jupyter -p 8080:8080 gcr.io/kaggle-images/python /bin/bash`

### Start the Jupyter notebook server
Files created by the Jupyter notebook will be owned by `root`
| Command | Web URL |
| ------- | ------- |
|`bash run_jupyter.sh`| http://localhost:8080/|
No token is needed to access the notebook server.