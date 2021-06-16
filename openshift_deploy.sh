#!/bin/bash

curl https://mirror.openshift.com/pub/openshift-v4/clients/oc/4.1/linux/oc.tar.gz | tar xz
./oc login --token=NY5RTLgNq7Pa9ODa-CCP2TGHx2R4fG6sxbOIsIO99o8 --server=https://c100-e.us-east.containers.cloud.ibm.com:31217
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
./oc create secret generic regtoken --from-file .dockerconfigjson=/home/travis/.docker/config.json --type kubernetes.io/dockerconfigjson
./oc import-image frontend --confirm --from us.icr.io/web-frontend-dev/frontend:latest
./oc new-app --as-deployment-config -i frontend
