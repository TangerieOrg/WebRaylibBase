FROM --platform=$BUILDPLATFORM ubuntu:latest

SHELL ["/bin/bash", "-c"]

# Main dependencies
RUN apt-get update && \
    apt-get install -y git build-essential python3 cmake ninja-build clang

WORKDIR /emsdk
RUN git clone https://github.com/emscripten-core/emsdk.git .
RUN git pull

RUN ./emsdk install latest && \
    ./emsdk activate latest && \
    echo "source /emsdk/emsdk_env.sh" >> ~/.bashrc && \
    source ~/.bashrc

WORKDIR /raylib
RUN git clone https://github.com/raysan5/raylib.git .

RUN apt-get install -y libasound2-dev mesa-common-dev libx11-dev libxrandr-dev libxi-dev xorg-dev libgl1-mesa-dev libglu1-mesa-dev clang

COPY entry.sh /entry.sh

RUN mkdir build
RUN cd /emsdk && . /emsdk/emsdk_env.sh && cd /raylib && emcmake cmake -S . -B build "-DPLATFORM=Web"
RUN cd /emsdk && . /emsdk/emsdk_env.sh && cd /raylib && cmake --build build --target install

SHELL ["/entry.sh", "/bin/bash", "-c"]