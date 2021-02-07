#!/bin/bash

echo "Run this script whole your $PWD is the root of your python source/notebooks"
echo "Starting kaggle python container and Jupyter notebook server disconnected with GPU enabled"
docker run --runtime nvidia --rm -it -v $PWD:/home/jupyter -p 8080:8080 --env NOTEBOOK_DISABLE_ROOT=true gcr.io/kaggle-gpu-images/python /run/run_jupyter.sh 
