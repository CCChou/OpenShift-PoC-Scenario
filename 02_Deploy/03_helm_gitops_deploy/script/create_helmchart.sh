#!/bin/bash

mkdir helm
cd helm
echo "--- Create helm at " $(pwd) " ---"

helm create $1