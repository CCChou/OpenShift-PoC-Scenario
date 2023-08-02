#!/bin/bash

oc new-project serverless-deploy
oc adm policy add-scc-to-user anyuid -z default