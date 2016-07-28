# Jean-Christophe's Argentina Planck demo

This is a Jupyter notebook packaged up inside a Docker container which comes preinstalled with a bunch of software needed to do a demo analysis of Planck data. Once the container is running, you can connect to the Jupyter notebook from your local browser. 

There are no software dependencies needed to run this except for having Docker installed. If you don't already have it, on Linux you can follow the instructions [here](https://docs.docker.com/engine/installation/#/on-linux), or on Windows/Mac install Docker Toolbox from [here](https://www.docker.com/products/docker-toolbox). Docker requires a 64bit computer, and for Windows/Mac your processor needs to have hardware virtualization (called VT-x or AMD-v) available and enabled (this is the vast majority of any computer made in the last ~5 years). 


With Docker installed, you can pull the image (a ~400Mb download):

```bash
docker pull marius311/jcdemo_argentina
```

To run it:

```bash
docker run -d -v $(pwd):/root/shared -p 8888:8888 jcdemo_argentina
```

At this point Juptyer is running and you simply need to point your browser to it. On Linux just go the URL `127.0.0.1:8888`. If you are running on Windows/Mac, replace `127.0.0.1` with the IP address reported when you start up the Docker Quickstart terminal.

The folder from where you do the `run` command is shared between Docker and your local computer, so changes you make to notebooks will be saved there. 
