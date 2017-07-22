# Install of Keras with Tensorflow backend
FROM tensorflow/tensorflow:latest-py3
MAINTAINER David Miller (davemiller76@gmail.com)

RUN apt-get update
RUN apt-get -yq install gcc build-essential zlib1g-dev wget

# Build HDF5
RUN cd ; wget https://support.hdfgroup.org/ftp/HDF5/prev-releases/hdf5-1.10/hdf5-1.10.1/src/hdf5-1.10.1.tar.gz
RUN cd ; tar zxf hdf5-1.10.1.tar.gz
RUN cd ; mv hdf5-1.10.1 hdf5-setup
RUN cd ; cd hdf5-setup ; ./configure --prefix=/usr/local/
RUN cd ; cd hdf5-setup ; make && make install

# cleanup
RUN cd ; rm -rf hdf5*
RUN apt-get -yq autoremove
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip install keras
RUN pip install h5py
RUN pip install opencv-python
RUN pip install tqdm
