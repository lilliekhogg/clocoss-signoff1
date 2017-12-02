#!/bin/bash


N=$1;
echo "The number of vms created will be $N"

secretKey=`openssl rand -base64 32`;
echo "the secret key is $secretKey"
workerName="lillie-worker";


#installing dependencies 
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash;
sudo apt-get -y install nodejs;
sudo apt-get install git;

#clone master-worker github
git clone https://github.com/portsoc/clocoss-master-worker;
cd clocoss-master-worker;
npm install;

gcloud config set compute/zone europe-west1-b;

#create the instances

for i in `seq 1 $N`;
do
        gcloud compute instances create "$workerName"-"$i" \
        --machine-type f1-micro \
        --tags http-server,https-server \
        --metadata secret=$secretKey,serverip=`curl -s -H "Metadata-Flavor: Google" \
                                               "http://metadata.google.internal/computeMetadata/v1/instance/network-interfaces/0/access-configs/0/external-ip"` \
        --metadata-from-file \
        startup-script=../startup-script.sh \
        --quiet;
done;

#running server
npm run server $secretKey;


