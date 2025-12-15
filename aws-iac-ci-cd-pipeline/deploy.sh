#!/bin/bash
set -e

echo "Deploying image: $IMAGE_URI"

REGISTRY=$(echo $IMAGE_URI | cut -d/ -f1)

aws ecr get-login-password \
  | docker login --username AWS --password-stdin $REGISTRY

docker pull $IMAGE_URI

docker stop app || true
docker rm app || true

docker run -d \
  --name app \
  -p 8080:8080 \
  $IMAGE_URI

