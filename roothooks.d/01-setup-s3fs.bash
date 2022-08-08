#!/bin/bash
# This script is run as root inside the *container* as each user when their server starts.
set -euo pipefail

export NB_UID=1000
mkdir -p /data/allen-brain-observatory
mkdir -p /data/em-connectomics-data
mkdir -p /data/visual-behavior-neuropixels-data
mkdir -p /data/visual-behavior-ophys-data

s3fs allen-brain-observatory \
    /data/allen-brain-observatory \
    -o default_acl="public-read" \
    -o complement_stat,uid=${NB_UID},gid=${NB_UID},umask=0222,allow_other,public_bucket="1",endpoint="us-west-2"
s3fs em-connectomics-data \
    /data/em-connectomics-data \
    -o default_acl="public-read" \
    -o complement_stat,uid=${NB_UID},gid=${NB_UID},umask=0222,allow_other,public_bucket="1",endpoint="us-west-2"
s3fs visual-behavior-neuropixels-data \
    /data/visual-behavior-neuropixels-data \
    -o default_acl="public-read" \
    -o complement_stat,uid=${NB_UID},gid=${NB_UID},umask=0222,allow_other,public_bucket="1",endpoint="us-west-2"
s3fs visual-behavior-ophys-data \
    /data/visual-behavior-ophys-data \
    -o default_acl="public-read" \
    -o complement_stat,uid=${NB_UID},gid=${NB_UID},umask=0222,allow_other,public_bucket="1",endpoint="us-west-2"
