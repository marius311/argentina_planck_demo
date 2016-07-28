FROM ubuntu:16.04

RUN apt-get update \
    && apt-get install -y \
        curl \
        cython \
        gfortran \
        python-matplotlib \
        python-numpy \
        python-pip \
        python-pyfits \
        python-scipy \
        python-tables \
        python-zmq \
    && pip install jupyter pypico pandas

WORKDIR /root


# install healpy 
RUN curl -L https://pypi.python.org/packages/source/h/healpy/healpy-1.9.1.tar.gz | tar zxf - \
    && cd healpy-1.9.1 \
    && python ez_setup.py \
    && python setup.py develop -N \
    && rm -rf build cfitsio healpixsubmodule
ENV PYTHONPATH=/root/healpy-1.9.1

# install camb
RUN mkdir camb \
    && curl -L https://github.com/cmbant/camb/tarball/003abb6 | tar zxf - -C camb --strip=1 \
    && cd camb/pycamb \
    && python setup.py install
    
WORKDIR /root/shared

COPY jcset.dat /root/data/jcset.dat

CMD jupyter-notebook --ip=* --no-browser
