#!/bin/bash

#installing dependencies
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash;
sudo apt-get install -y nodejs;
sudo apt-get install -y git;

#installing the clocoss-master-worker

git clone https://github.com/portsoc/clocoss-master-worker;
cd clocoss-master-worker;
npm install;

#initialising the parameters
secretKey=`curl -s -H "Metadata-Flavor: Google"  \
              "http://metadata.google.internal/computeMetadata/v1/instance/attributes/secret"`;
serverip=`curl -s -H "Metadata-Flavor: Google"  \
               "http://metadata.google.internal/computeMetadata/v1/instance/attributes/ip"`;


#run the client
npm run client $secretKey $serverip:8080;
