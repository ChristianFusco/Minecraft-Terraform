#!/bin/bash

sudo apt-get update

# terraform 
terraform_version=0.12.5
sudo apt-get install unzip
wget https://releases.hashicorp.com/terraform/${terraform_version}/terraform_${terraform_version}_linux_amd64.zip
unzip terraform_${terraform_version}_linux_amd64.zip
sudo mv terraform /usr/local/bin/
rm terraform_${terraform_version}_linux_amd64.zip

# aws cli

curl -O https://bootstrap.pypa.io/get-pip.py
python get-pip.py --user
echo "export PATH=~/.local/bin:$PATH" >> ~/.profile
source ~/.profile

pip install awscli --upgrade --user
rm get-pip.py

aws configure

