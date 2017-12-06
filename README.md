# clocoss-signoff1

Script for executing signoff 1 for clocoss coursework by up718528.

# what does this script do?
1. Generate a random secretKey combination which is shared between VMs 
2. Clone the clocoss-master-worker repository
3. Install the server and its dependancies
4. create N number of Vms
5. once the Vms have been created they will do the following:
- download and install the client software 
- run the client using serverip and secretKey
- shut down when the client exits
6. The VM will carry out 100 tasks
7. Once the 100 tasks have been completed, the system will
- Delete client run Vms
- Delete client run disks

# How To Use
To use the distributed worker app you will need to do the following tasks:
1. git clone https://github.com/lilliekhogg/clocoss-signoff1.git
2. cd clocoss-signoff1
3. sh task1.sh (no_vms_required)


# Extra Information
Dependancies may need to be applied first if they are not already installed on your vm:
- curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
- sudo apt-get install -y nodejs
- sudo apt-get install git
