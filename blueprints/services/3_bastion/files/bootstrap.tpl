#! /bin/bash

apt-get update
apt-get install -y default-jre python-apt unzip

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

aws s3 cp s3://${s3_bucket}/software/cis-cat/CIS-CAT_Lite_v4.3.1.zip /home/ubuntu/
cd /home/ubuntu
unzip CIS-CAT_Lite_v4.3.1.zip