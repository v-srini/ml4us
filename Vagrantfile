$update = <<SCRIPT
apt-get update  -y
apt-get upgrade -y
apt-get install git -y
SCRIPT

$ann = <<SCRIPT
sudo useradd -m -s /bin/bash -G sudo ann
su - ann -c "cp /home/vagrant/Anaconda3-4.4.0-Linux-x86_64.sh /home/ann/" 
su - ann -c "bash Anaconda3-4.4.0-Linux-x86_64.sh -b -p anaconda3"
SCRIPT

Vagrant.configure("2") do |config|

  config.vm.define "ml4us" do |ml4us|
    ml4us.vm.box = "ubuntu/trusty64"
    ml4us.vm.hostname = "ml4us"

    ml4us.vm.provision "shell", inline: $update

    ml4us.vm.provision "do-this",  
      type: "shell",
      preserve_order: true,
      privileged: false, 
      inline: "wget -q https://repo.continuum.io/archive/Anaconda3-4.4.0-Linux-x86_64.sh"
    ml4us.vm.provision "then-this",  
      type: "shell",
      preserve_order: true,
      privileged: true, 
      inline: $ann
    
    ml4us.vm.provision "file", source: "README.txt", destination: "/home/ann/README.txt"

    ml4us.vm.provision "shell" do |s|
      s.path = "provision.sh"
      s.privileged = "true" 
    end
  end
end
