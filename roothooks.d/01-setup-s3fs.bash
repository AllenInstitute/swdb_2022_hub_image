#!/bin/bash
# This script is run as root inside the *container* as each user when their server starts.
set -euo pipefail

export NB_UID=1000
mkdir -p /data/visual-behavior-ophys-data

s3fs visual-behavior-ophys-data \
    /data/visual-behavior-ophys-data \
    -o default_acl="public-read" \
    -o complement_stat,uid=${NB_UID},gid=${NB_UID},umask=0222,allow_other,public_bucket="1",endpoint="us-west-2"