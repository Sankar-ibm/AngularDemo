#!/bin/bash

curl https://mirror.openshift.com/pub/openshift-v4/clients/oc/4.1/linux/oc.tar.gz | tar xz
./oc login --token=NY5RTLgNq7Pa9ODa-CCP2TGHx2R4fG6sxbOIsIO99o8 --server=https://c100-e.us-east.containers.cloud.ibm.com:31217
docker login -u iamapikey -p $CLOUD_API_KEY us.icr.io
./oc create secret generic regtoken --from-file .dockerconfigjson=/home/travis/.docker/config.json --type kubernetes.io/dockerconfigjson
./oc import-image web-frontend-dev --confirm --from us.icr.io/web-frontend-dev/web-frontend:latest
./oc new-app --as-deployment-config -i web-frontend-dev
