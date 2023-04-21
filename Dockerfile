FROM --platform=$BUILDPLATFORM ubuntu:latest

SHELL ["/bin/bash", "-c"]

# Main dependencies
RUN apt-get update && \
    apt-get install -y git build-essential python3 cmake ninja-build

WORKDIR /emsdk
RUN git clone https://github.com/emscripten-core/emsdk.git .
RUN git pull

RUN ./emsdk install latest && \
    ./emsdk activate latest && \
    echo "source /emsdk/emsdk_env.sh" >> ~/.bashrc && \
    source ~/.bashrc

WORKDIR /raylib
RUN git clone https://github.com/raysan5/raylib.git .

RUN apt-get install -y libasound2-dev mesa-common-dev libx11-dev libxrandr-dev libxi-dev xorg-dev libgl1-mesa-dev libglu1-mesa-dev

RUN mkdir build
RUN cd /emsdk && . /emsdk/emsdk_env.sh && cd /raylib && emcmake cmake -S . -B build "-DPLATFORM=Web"
RUN cd /emsdk && . /emsdk/emsdk_env.sh && cd /raylib && cmake --build build --target install

ENV PATH="$PATH:/emsdk"
ENV EMSDK /emsdk
ENV EMSDK_NODE ${EMSDK}/node/15.14.0_64bit/bin/node