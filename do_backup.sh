#!/bin/bash

# hostname=`hostname`

# aws s3 create-bucket --bucket $hostname
# echo 'will backup to bucket `aws s3 ls | grep $host-name`'

> ~/folders_to_back_up.backup
find ~/test -type f -name .dobackup | xargs -L 1 dirname >> ~/folders_to_back_up.backup

echo 'will backup folders:'
cat ~/folders_to_back_up.backup

sed -i -E 's@^\(.*\)@aws s3 sync \1 s3://BUCKET_NAME\1@g' ~/folders_to_back_up.backup
source ~/folders_to_back_up.backup
