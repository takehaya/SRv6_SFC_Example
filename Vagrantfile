Vagrant.configure("2") do |config|
    # host A node configuration
	config.vm.define "host_a" do |host_a|
        # host_a.vm.box = "bento/ubuntu-18.04"
        host_a.vm.box = "ictsc_SRT"     
        host_a.vm.synced_folder("./workspace", "/home/vagrant/workspace")
		host_a.vm.network "private_network", ip: "10.0.0.1", virtualbox__intnet: "net01"
		host_a.vm.provider "virtualbox" do |virtualbox|
            virtualbox.memory = "512"
			virtualbox.cpus = "1"
            virtualbox.customize ['modifyvm', :id, '--cableconnected1', 'on']
            virtualbox.customize ['modifyvm', :id, '--cableconnected2', 'on']
        end
        # host_a.vm.provision "shell", path: "config/setup.sh"
        host_a.vm.provision "shell", path: "config/config_host_a.sh"
	end

    # Node R1 configuration
	config.vm.define "R1" do |r1|
        # r1.vm.box = "bento/ubuntu-18.04"
        r1.vm.box = "ictsc_SRT"     
        r1.vm.synced_folder("./workspace", "/home/vagrant/workspace")
        r1.vm.network "private_network", ip: "10.0.0.2", virtualbox__intnet: "net01"
		r1.vm.network "private_network", ip: "2001:12::1", netmask: "64", virtualbox__intnet: "net12"
		r1.vm.provider "virtualbox" do |virtualbox|
            virtualbox.memory = "512"
			virtualbox.cpus = "1"
			virtualbox.customize ['modifyvm', :id, '--cableconnected1', 'on']
            virtualbox.customize ['modifyvm', :id, '--cableconnected2', 'on']
            virtualbox.customize ['modifyvm', :id, '--cableconnected3', 'on']
        end
        # r1.vm.provision "shell", path: "config/setup.sh"
        r1.vm.provision "shell", path: "config/config_R1.sh"
	end

    # Node R2 configuration
    # ipv6 only node
	config.vm.define "R2" do |r2|
        # r2.vm.box = "bento/ubuntu-18.04"
        r2.vm.box = "ictsc_SRT"
		r2.vm.synced_folder("./workspace", "/home/vagrant/workspace")
		r2.vm.network "private_network", ip: "2001:12::2", netmask: "64", virtualbox__intnet: "net12"
        r2.vm.network "private_network", ip: "2001:23::1", netmask: "64", virtualbox__intnet: "net23"
		r2.vm.network "private_network", ip: "2001:24::1", netmask: "64", virtualbox__intnet: "net24"
		r2.vm.provider "virtualbox" do |virtualbox|
			virtualbox.memory = "512"
			virtualbox.cpus = "1"
			virtualbox.customize ['modifyvm', :id, '--cableconnected1', 'on']
			virtualbox.customize ['modifyvm', :id, '--cableconnected2', 'on']
            virtualbox.customize ['modifyvm', :id, '--cableconnected3', 'on']
            virtualbox.customize ['modifyvm', :id, '--cableconnected4', 'on']
        end
        # r2.vm.provision "shell", path: "config/setup.sh"
        r2.vm.provision "shell", path: "config/config_R2.sh"
	end

    # Node R3 configuration
    config.vm.define "R3" do |r3|
        # r3.vm.box = "bento/ubuntu-18.04"
        r3.vm.box = "ictsc_SRT"     
		r3.vm.synced_folder("./workspace", "/home/vagrant/workspace")
        r3.vm.network "private_network", ip: "2001:23::2",netmask: "64", virtualbox__intnet: "net23"
        r3.vm.network "private_network", ip: "2001:35::1",netmask: "64",virtualbox__intnet: "net35"
        r3.vm.network "private_network", ip: "2001:34::1",netmask: "64", virtualbox__intnet: "net34"
        r3.vm.provider "virtualbox" do |virtualbox|
                virtualbox.memory = "512"
                virtualbox.cpus = "1"
                virtualbox.customize ['modifyvm', :id, '--cableconnected1', 'on']
                virtualbox.customize ['modifyvm', :id, '--cableconnected2', 'on']
                virtualbox.customize ['modifyvm', :id, '--cableconnected3', 'on']
                virtualbox.customize ['modifyvm', :id, '--cableconnected4', 'on']

            end
        # r3.vm.provision "shell", path: "config/setup.sh"
        r3.vm.provision "shell", path: "config/config_R3.sh"
    end

    # Node R4 configuration
    config.vm.define "R4" do |r4|
        # r4.vm.box = "bento/ubuntu-18.04"
        r4.vm.box = "ictsc_SRT"
        r4.vm.synced_folder("./workspace", "/home/vagrant/workspace")     
        r4.vm.network "private_network", ip: "2001:24::2",netmask: "64", virtualbox__intnet: "net24"
        r4.vm.network "private_network", ip: "2001:34::2",netmask: "64", virtualbox__intnet: "net34"
        r4.vm.network "private_network", ip: "10.0.1.2", virtualbox__intnet: "net46"
        r4.vm.provider "virtualbox" do |virtualbox|
                virtualbox.memory = "512"
                virtualbox.cpus = "1"
                virtualbox.customize ['modifyvm', :id, '--cableconnected1', 'on']
                virtualbox.customize ['modifyvm', :id, '--cableconnected2', 'on']
                virtualbox.customize ['modifyvm', :id, '--cableconnected3', 'on']
                virtualbox.customize ['modifyvm', :id, '--cableconnected4', 'on']
        end
        # r4.vm.provision "shell", path: "config/setup.sh"
        r4.vm.provision "shell", path: "config/config_R4.sh"
    end

    # Node 5(FW1) configuration
    config.vm.define "FW1" do |fw1|
        # fw1.vm.box = "bento/ubuntu-18.04"
        fw1.vm.box = "ictsc_SRT"
        fw1.vm.synced_folder("./workspace", "/home/vagrant/workspace")     
        fw1.vm.network "private_network", ip: "2001:35::2",netmask: "64",virtualbox__intnet: "net35"
        fw1.vm.provider "virtualbox" do |virtualbox|
                virtualbox.memory = "512"
                virtualbox.cpus = "1"
                virtualbox.customize ['modifyvm', :id, '--cableconnected1', 'on']
                virtualbox.customize ['modifyvm', :id, '--cableconnected2', 'on']
            end
        # fw1.vm.provision "shell", path: "config/setup.sh"
        fw1.vm.provision "shell", path: "config/config_FW1.sh"
    end

    # host b configuration
    config.vm.define "host_b" do |host_b|
        # host_b.vm.box = "bento/ubuntu-18.04"
        host_b.vm.box = "ictsc_SRT"
        host_b.vm.synced_folder("./workspace", "/home/vagrant/workspace")
        host_b.vm.network "private_network", ip: "10.0.1.1", virtualbox__intnet: "net46"
        host_b.vm.provider "virtualbox" do |virtualbox|
                virtualbox.memory = "512"
                virtualbox.cpus = "1"
                virtualbox.customize ['modifyvm', :id, '--cableconnected1', 'on']
                virtualbox.customize ['modifyvm', :id, '--cableconnected2', 'on']

        end
        # host_b.vm.provision "shell", path: "config/setup.sh"
        host_b.vm.provision "shell", path: "config/config_host_b.sh"
    end
end