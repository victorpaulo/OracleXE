Vagrant.configure("2") do |config|

  config.vm.define "oracle" do |ora|
    ora.vm.box = "redhat65"
	ora.vm.host_name = "oracle.domain.com"
	ora.vm.network "public_network", ip: "192.168.1.1"
	ora.vm.provider :virtualbox do |vb|
		vb.name = "ORACLE 11g"
		vb.gui = false
		vb.memory = 4096
		vb.cpus = 2
	end
	ora.vm.provision :shell, :path => "install.sh"

  end
end