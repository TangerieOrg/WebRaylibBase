FROM --platform=$BUILDPLATFORM docker.tangerie.xyz/docker-emsdk:latest

WORKDIR /raylib
RUN git clone https://github.com/raysan5/raylib.git .

RUN apt-get install -y libasound2-dev mesa-common-dev libx11-dev libxrandr-dev libxi-dev xorg-dev libgl1-mesa-dev libglu1-mesa-dev clang

RUN mkdir build
RUN emcmake cmake -S . -B build "-DPLATFORM=Web"
RUN cmake --build build --target install