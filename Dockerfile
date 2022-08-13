FROM jupyter/pyspark-notebook:ubuntu-22.04

ENV LANG=C.UTF-8

WORKDIR /opt

COPY packages packages
COPY pip_packages pip_packages

USER root

RUN apt-get update -qq \
 && ln -sf /usr/share/zoneinfo/UTC /etc/localtime \
 && apt-get -y install $(cat packages) 

RUN apt-get -y install -y libpcre3-dev \
xlibmesa-glu-dev libglew-dev libftgl-dev \
libmysqlclient-dev libfftw3-dev libcfitsio-dev \
graphviz-dev libavahi-compat-libdnssd-dev \
libldap2-dev libxml2-dev libkrb5-dev \
libgsl0-dev

RUN git clone --branch latest-stable https://github.com/root-project/root.git root_src \
 && mkdir root_build root && cd root_build \
 && cmake -DCMAKE_INSTALL_PREFIX=../root ../root_src \
 && cmake --build . -- install -j15 

USER $NB_UID

ENV ROOTSYS /opt/root
ENV PATH $ROOTSYS/bin:$PATH
ENV PYTHONPATH $ROOTSYS/lib:$PYTHONPATH
ENV CLING_STANDARD_PCH none

RUN pip install --quiet --no-cache-dir $(cat pip_packages)

WORKDIR /home/${NB_USER}
ENV USERNAME=${NB_USER}
USER root

RUN echo /opt/root/lib >> /etc/ld.so.conf \
 && ldconfig

USER $NB_UID