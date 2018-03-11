#!/bin/bash

# hostname=`hostname`
# aws s3 create-bucket --bucket $hostname
# echo 'will backup to bucket `aws s3 ls | grep $host-name`'

find ~/ -type f -name .dobackup | sed 's#//#/#' | xargs -L 1 dirname > ~/.folders_to_back_up

echo 'will backup folders:'
cat ~/.folders_to_back_up

# Specify --delete to delete files that only exist in target
sed -i -E 's@^\(.*\)@aws s3 sync --exclude "^.*" \1 s3://{BUCKET_NAME}\1 --delete@g' ~/.folders_to_back_up
source ~/.folders_to_back_up
echo 'done'
exit 0
