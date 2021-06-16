#!/bin/bash

docker login -u iamapikey -p 6bD6gn-hdjsbSuCNMB0tdjRyGqLV27tA0MNYUQT74izj us.icr.io
oc create secret generic regtoken --from-file .dockerconfigjson=${XDG_RUNTIME_DIR}/containers/auth.json --type kubernetes.io/dockerconfigjson
oc import-image web-frontend --confirm --reference-policy local --from us.icr.io/web-frontend-dev/web-frontend:latest
oc new-app --as-deployment-config -i web-frontend
