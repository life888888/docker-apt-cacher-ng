export VERSION=1.0.0
export CREATOR=life888888
export REPOSITORY=docker-apt-cacher-ng
export DOCKER_NAME=docker-apt-cacher-ng

docker build  \
       --label "org.opencontainers.image.source=https://github.com/${CREATOR}/${REPOSITORY}" \
       --label "org.opencontainers.image.description=${REPOSITORY}" \
       --label "org.opencontainers.image.licenses=MIT" \
       -t ${DOCKER_NAME}:${VERSION} .
       
docker tag ${DOCKER_NAME}:${VERSION} ${DOCKER_NAME}:latest

echo "DONE!"

