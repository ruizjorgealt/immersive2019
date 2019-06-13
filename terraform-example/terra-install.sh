#!/bin/bash
apt-get update
apt-get install unzip
wget https://releases.hashicorp.com/terraform/0.12.2/terraform_0.12.2_linux_amd64.zip
unzip terraform_0.12.2_linux_amd64.zip
mv terraform /usr/local/bin/
terraform --version
