IMAGE_NAME=docker.tangerie.xyz/webraylib:latest
ARCH_LIST=linux/arm64/v8,linux/amd64

docker buildx build --push --platform $ARCH_LIST -t $IMAGE_NAME .