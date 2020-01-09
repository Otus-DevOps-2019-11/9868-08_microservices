#!/bin/sh

gcloud compute instances create reddit-gcloud-script \
    --image reddit-base-1578467159 \
    --image-project forward-karma-262407
gcloud config set project  forward-karma-262407
