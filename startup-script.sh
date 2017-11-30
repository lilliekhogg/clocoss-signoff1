#!/bin/bash



#installing the clocoss-master-worker

git clone https://github.com/portsoc/clocoss-master-worker;
cd clocoss-master-worker;
npm install;

#initialising the parameters
secretKey=`curl -s -H "Metadata-Flavor: Google"  \
"http://metadata.google.internal/computeMetadata/v1/instance/attributes/secret"`;
serverip=`curl -s -H "Metadata-Flavor: Google"  \
"http://metadata.google.internal/computeMetadata/v1/instance/attributes/serverip"`;


#run the client
npm run client $secretKey; $serverip:8080;
