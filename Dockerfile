FROM ubuntu:18.04
LABEL maintainer="me@abiusx.com"

ENV container docker

RUN export DEBIAN_FRONTEND=noninteractive && apt-get update -y && apt-get install -yq php-dev build-essential libz-dev libssl-dev gperf cmake git

RUN cd $HOME &&\
#    git clone https://github.com/tdlib/td.git &&\
    git clone https://github.com/CopernicaMarketingSoftware/PHP-CPP.git &&\
#    git clone https://github.com/nlohmann/json.git &&\
    git clone --recurse-submodules https://github.com/yaroslavche/phptdlib.git

RUN cd $HOME/PHP-CPP && \
    make &&\
    make install &&\
    make clean

#RUN cd $HOME/json && mkdir build && cd build &&\
#    cmake ..&&\
#    make install &&\
#    make clean &&\
#    rm -rf $HOME/json/build

#RUN cd $HOME/td && mkdir build && cd build &&\
#    cmake -DCMAKE_BUILD_TYPE=Release .. &&\
#    cmake --build . &&\
#    cmake --build . --target install &&\
#    rm -rf $HOME/td/build

RUN cd $HOME/phptdlib && \
    mkdir build && cd build && \
#    cmake -DTDLIB_BUILD_TESTS=ON .. && \
    cmake .. && \
    make && \
    make install
