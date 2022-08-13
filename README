## Juproot docker image
Contains:
- [ROOT](https://root.cern.ch/)
- [uproot](https://uproot.readthedocs.io)
- [jupyter](https://jupyter.org/)
- [pyspark](https://spark.apache.org)
- [xgboost](https://xgboost.readthedocs.io)
- [pytorch](https://pytorch.org/)
- [tensorflow](https://www.tensorflow.org)
- [numba](https://numba.pydata.org/)
- pandas, numpy, matplotlib, ...
- some hep stuff

Based on:
- ubuntu:22.04
- [jupyter/pyspark-notebook](https://hub.docker.com/r/jupyter/pyspark-notebook)
- python:3.10.x  

## Usage:
Launch a notebook server on the local port 8888 
```bash
docker run --rm -it -p 8888:8888 jakubmalczewski/juproot:latest
```

Run an interactive shell
```bash
docker run --rm -it jakubmalczewski/juproot:latest start.sh
```

Execute a python script from a local directory
```bash
docker run --rm -it -v ${PWD}:/app -w /app jakubmalczewski/juproot:latest start.sh python <script>.py
```
