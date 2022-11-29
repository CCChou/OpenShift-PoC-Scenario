#!/bin/bash

oc new-project $1 ; echo "--- Deploy App in" $(oc project -q) "---"

echo "--- Create EAP template ---"
oc create -f \
https://raw.githubusercontent.com/jboss-container-images/jboss-eap-openshift-templates/eap74/eap74-openjdk11-image-stream.json

for resource in \
  eap74-amq-persistent-s2i.json \
  eap74-amq-s2i.json \
  eap74-basic-s2i.json \
  eap74-https-s2i.json \
  eap74-sso-s2i.json
do
  oc create -f \
https://raw.githubusercontent.com/jboss-container-images/jboss-eap-openshift-templates/eap74/templates/${resource}
done

echo "--- Create App in" $(oc project -q) "---"
oc new-app --template=eap74-basic-s2i \
 -p EAP_IMAGE_NAME=jboss-eap74-openjdk11-openshift:7.4.0 \
 -p EAP_RUNTIME_IMAGE_NAME=jboss-eap74-openjdk11-runtime-openshift:7.4.0 \
 -p IMAGE_STREAM_NAMESPACE=$(oc project -q) \
 -p SOURCE_REPOSITORY_URL=https://github.com/jboss-developer/jboss-eap-quickstarts.git \
 -p SOURCE_REPOSITORY_REF=7.4.x \
 -p GALLEON_PROVISION_LAYERS=jaxrs-server \
 -p CONTEXT_DIR=helloworld-html5