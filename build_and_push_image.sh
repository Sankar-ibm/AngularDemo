#!/bin/bash

cr_namespace=$1
echo "Container Registry Namespace: $cr_namespace"

############################################################################
# Download and install IBM CLI                                             #
############################################################################
echo "Install IBM Cloud CLI"
curl -sL https://ibm.biz/idt-installer | bash

############################################################################
# Log into the IBM Cloud environment using apikey                          #
############################################################################
echo "Login to IBM Cloud using apikey"
ibmcloud config --check-version=false
ibmcloud login -a https://api.ng.bluemix.net --apikey $CLOUD_API_KEY -r us-south
if [ $? -ne 0 ]; then
  echo "Failed to authenticate to IBM Cloud"
  exit 1
fi

############################################################################
# tag the image as latest and with the custom tag                          #
############################################################################
echo "Tagging the image as web-frontend:$DEPLOY_TIMESTAMP-$TRAVIS_BUILD_NUMBER-$TRAVIS_BRANCH and web-frontend:latest"
docker tag web-frontend:$DEPLOY_TIMESTAMP-$TRAVIS_BUILD_NUMBER-$TRAVIS_BRANCH us.icr.io/$cr_namespace/web-frontend:$DEPLOY_TIMESTAMP-$TRAVIS_BUILD_NUMBER-$TRAVIS_BRANCH
docker tag web-frontend:latest us.icr.io/$cr_namespace/web-frontend:latest

############################################################################
# Log into the IBM Cloud container registry                                          #
############################################################################
echo "Logging into IBM Cloud container registry"
ibmcloud cr login
if [ $? -ne 0 ]; then
  echo "Failed to authenticate to IBM Cloud container registry"
  exit 1
fi

############################################################################
# If the image exists in the container registry then delete it             #
# then recreate it                                                         #
############################################################################
echo "looking to see if the image exists"
echo "using command: ibmcloud cr images | grep us.icr.io/$cr_namespace/web-frontend:$DEPLOY_TIMESTAMP-$TRAVIS_BUILD_NUMBER-$TRAVIS_BRANCH"

lookup_image=$( ibmcloud cr images | grep "us.icr.io/$cr_namespace/web-frontend:$DEPLOY_TIMESTAMP-$TRAVIS_BUILD_NUMBER-$TRAVIS_BRANCH" )

echo "Now looking to see if the image exists"
echo "using command: ibmcloud cr images | grep us.icr.io/$cr_namespace/web-frontend:latest"

lookup_image=$( ibmcloud cr images | grep "us.icr.io/$cr_namespace/web-frontend:latest" )

############################################################################
# Push the image                                                           #
############################################################################
echo "Pushing image to registry"
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker push us.icr.io/$cr_namespace/web-frontend:$DEPLOY_TIMESTAMP-$TRAVIS_BUILD_NUMBER-$TRAVIS_BRANCH
docker push us.icr.io/$cr_namespace/web-frontend:latest
############################################################################
# end script                                                               #
############################################################################
