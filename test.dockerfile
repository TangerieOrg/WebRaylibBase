FROM docker.tangerie.xyz/webraylib:latest

RUN emcc -v
RUN echo "CC = $CC | CXX = $CXX"