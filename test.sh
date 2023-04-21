IMAGE_NAME=docker.tangerie.xyz/webraylib_test:latest
ARCH_LIST=linux/arm64/v8,linux/amd64

docker build -t $IMAGE_NAME -f test.dockerfile .