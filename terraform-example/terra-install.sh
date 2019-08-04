#!/bin/bash
apt-get update -y
apt-get install unzip wget -y
wget https://releases.hashicorp.com/terraform/0.12.2/terraform_0.12.2_linux_amd64.zip
unzip terraform_0.12.2_linux_amd64.zip
mv terraform /usr/local/bin/
terraform --version
