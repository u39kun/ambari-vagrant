# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "centos6.4"
  # config.vm.box = "centos5.8"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.

  # CentOS 6.4 x86_64 Minimal (VirtualBox Guest Additions 4.2.12, Chef 11.4.4, Puppet 3.1.1)
  config.vm.box_url = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130427.box"

  # CentOS 5.8 x86_64 minimal + guest additions, puppet, chef
  # config.vm.box_url = "http://tag1consulting.com/files/centos-5.8-x86-64-minimal.box"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", 2048] # RAM allocated to each VM
  end

  config.vm.provision :shell, :path => "bootstrap.sh"

  config.vm.define :dev01 do |dev01|
    dev01.vm.hostname = "dev01.ambari.apache.org"
    dev01.vm.network :private_network, ip: "192.168.56.101"
  end

  config.vm.define :dev02 do |dev02|
    dev02.vm.hostname = "dev02.ambari.apache.org"
    dev02.vm.network :private_network, ip: "192.168.56.102"
  end

  config.vm.define :dev03 do |dev03|
    dev03.vm.hostname = "dev03.ambari.apache.org"
    dev03.vm.network :private_network, ip: "192.168.56.103"
  end

  config.vm.define :dev04 do |dev04|
    dev04.vm.hostname = "dev04.ambari.apache.org"
    dev04.vm.network :private_network, ip: "192.168.56.104"
  end

  config.vm.define :dev05 do |dev05|
    dev05.vm.hostname = "dev05.ambari.apache.org"
    dev05.vm.network :private_network, ip: "192.168.56.105"
  end

  config.vm.define :dev06 do |dev06|
    dev06.vm.hostname = "dev06.ambari.apache.org"
    dev06.vm.network :private_network, ip: "192.168.56.106"
  end

  config.vm.define :dev07 do |dev07|
    dev07.vm.hostname = "dev07.ambari.apache.org"
    dev07.vm.network :private_network, ip: "192.168.56.107"
  end

  config.vm.define :dev08 do |dev08|
    dev08.vm.hostname = "dev08.ambari.apache.org"
    dev08.vm.network :private_network, ip: "192.168.56.108"
  end

  config.vm.define :dev09 do |dev09|
    dev09.vm.hostname = "dev09.ambari.apache.org"
    dev09.vm.network :private_network, ip: "192.168.56.109"
  end

  config.vm.define :dev10 do |dev10|
    dev10.vm.hostname = "dev10.ambari.apache.org"
    dev10.vm.network :private_network, ip: "192.168.56.110"
  end













  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network :forwarded_port, guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network :private_network, ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network :public_network

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  # config.ssh.forward_agent = true

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider :virtualbox do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
  #   vb.customize ["modifyvm", :id, "--memory", "1024"]
  # end
  #
  # View the documentation for the provider you're using for more
  # information on available options.

  # Enable provisioning with Puppet stand alone.  Puppet manifests
  # are contained in a directory path relative to this Vagrantfile.
  # You will need to create the manifests directory and a manifest in
  # the file precise32.pp in the manifests_path directory.
  #
  # An example Puppet manifest to provision the message of the day:
  #
  # # group { "puppet":
  # #   ensure => "present",
  # # }
  # #
  # # File { owner => 0, group => 0, mode => 0644 }
  # #
  # # file { '/etc/motd':
  # #   content => "Welcome to your Vagrant-built virtual machine!
  # #               Managed by Puppet.\n"
  # # }
  #
  # config.vm.provision :puppet do |puppet|
  #   puppet.manifests_path = "manifests"
  #   puppet.manifest_file  = "init.pp"
  # end

  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  #
  # config.vm.provision :chef_solo do |chef|
  #   chef.cookbooks_path = "../my-recipes/cookbooks"
  #   chef.roles_path = "../my-recipes/roles"
  #   chef.data_bags_path = "../my-recipes/data_bags"
  #   chef.add_recipe "mysql"
  #   chef.add_role "web"
  #
  #   # You may also specify custom JSON attributes:
  #   chef.json = { :mysql_password => "foo" }
  # end

  # Enable provisioning with chef server, specifying the chef server URL,
  # and the path to the validation key (relative to this Vagrantfile).
  #
  # The Opscode Platform uses HTTPS. Substitute your organization for
  # ORGNAME in the URL and validation key.
  #
  # If you have your own Chef Server, use the appropriate URL, which may be
  # HTTP instead of HTTPS depending on your configuration. Also change the
  # validation key to validation.pem.
  #
  # config.vm.provision :chef_client do |chef|
  #   chef.chef_server_url = "https://api.opscode.com/organizations/ORGNAME"
  #   chef.validation_key_path = "ORGNAME-validator.pem"
  # end
  #
  # If you're using the Opscode platform, your validator client is
  # ORGNAME-validator, replacing ORGNAME with your organization name.
  #
  # If you have your own Chef Server, the default validation client name is
  # chef-validator, unless you changed the configuration.
  #
  #   chef.validation_client_name = "ORGNAME-validator"
end
