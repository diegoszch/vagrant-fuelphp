
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    config.vm.box = "vfuelphp"
  
    config.vm.box_url = "http://files.vagrantup.com/precise64.box"
    #config.vm.box_url = "C:\\diego\\vms\\box-vagrant\\precise64.box"  

    config.vm.network "forwarded_port", guest: 80, host: 8080
    config.vm.network "forwarded_port", guest: 3306, host: 33066
    config.vm.network "private_network", ip: "192.168.33.10"

    config.vm.synced_folder ".", "/vagrant", id: "vagrant-root", :nfs => true, :nfs_version => 4

    config.vm.provider "virtualbox" do |vb|
        vb.customize ["modifyvm", :id, "--memory", "1024"]
        vb.customize ["modifyvm", :id, "--cpus", 2]
        vb.customize ["modifyvm", :id, "--vram", 256]
        vb.customize ["modifyvm", :id, "--name", "vfuelphp"]
        vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end

    config.vm.provision "shell", path: "bootstrap.sh"
	
end
