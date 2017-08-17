This is an example of setting up ubuntu for running machine learning apps.

Anaconda3 and Postgres are installed here for the 'ann' account.


On the Host OS (Linux, Mac, Windows):

1. Install Virtualbox
2. Install Vagrant 1.9.7 or later

3. Open a command prompt
$> mkdir ml4us
$> cd ml4us 

4. Copy over the files Vagrantfile, provision.sh and README.txt to ml4us
$> vagrant box add ubuntu/trusty64
$> vagrant up ml4us
$> vagrant ssh


On the Guest OS:

$> sudo su - ann
$> git clone https://github.com/danbikle/keras11
$> cd keras11
$> python import_keras11.py
$> bash flask11.bash
^C
$> exit
$> exit

5. Open a second command prompt on the Host OS
$> cd ml4us
$> vagrant ssh
$> sudo su - ann
$> cd keras11
$> bash -x curlem.bash
$> exit
$> exit


6. To clean-up
$> vagrant halt ml4us
or
$> vagrant destroy ml4us
