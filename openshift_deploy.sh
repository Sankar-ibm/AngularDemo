#!/bin/bash

curl https://mirror.openshift.com/pub/openshift-v4/clients/oc/4.1/linux/oc.tar.gz | tar xz
./oc login --token=OLHiAQNW30OQCyKGNCmzDoStW1mgSnVZis82X6q1_WU --server=https://c100-e.us-east.containers.cloud.ibm.com:31217
docker login -u iamapikey -p oe4Q4aM_glYb9FNmzyx8GXwepkuLgILwBEHjc_hYhndE us.icr.io
# ./oc create secret generic regtoken --from-file .dockerconfigjson=${XDG_RUNTIME_DIR}/containers/auth.json --type kubernetes.io/dockerconfigjson
./oc import-image web-frontend --confirm --reference-policy local --from us.icr.io/web-frontend-dev/web-frontend:latest
./oc new-app --as-deployment-config -i web-frontend
