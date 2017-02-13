# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "bento/centos-6.8"

  # Fixes changes from https://github.com/mitchellh/vagrant/pull/4707
  config.ssh.insert_key = false

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", 3072] # RAM allocated to each VM
  end

  config.vm.provision :shell, :path => "bootstrap.sh"

  config.vm.define :c6801 do |c6801|
    # uncomment the line below to set up the ambari dev environment
    # c6801.vm.provision :shell, :path => "dev-bootstrap.sh"
    c6801.vm.hostname = "c6801.ambari.apache.org"
    c6801.vm.network :private_network, ip: "192.168.68.101"
  end

  config.vm.define :c6802 do |c6802|
    c6802.vm.hostname = "c6802.ambari.apache.org"
    c6802.vm.network :private_network, ip: "192.168.68.102"
  end

  config.vm.define :c6803 do |c6803|
    c6803.vm.hostname = "c6803.ambari.apache.org"
    c6803.vm.network :private_network, ip: "192.168.68.103"
  end

  config.vm.define :c6804 do |c6804|
    c6804.vm.hostname = "c6804.ambari.apache.org"
    c6804.vm.network :private_network, ip: "192.168.68.104"
  end

  config.vm.define :c6805 do |c6805|
    c6805.vm.hostname = "c6805.ambari.apache.org"
    c6805.vm.network :private_network, ip: "192.168.68.105"
  end

  config.vm.define :c6806 do |c6806|
    c6806.vm.hostname = "c6806.ambari.apache.org"
    c6806.vm.network :private_network, ip: "192.168.68.106"
  end

  config.vm.define :c6807 do |c6807|
    c6807.vm.hostname = "c6807.ambari.apache.org"
    c6807.vm.network :private_network, ip: "192.168.68.107"
  end

  config.vm.define :c6808 do |c6808|
    c6808.vm.hostname = "c6808.ambari.apache.org"
    c6808.vm.network :private_network, ip: "192.168.68.108"
  end

  config.vm.define :c6809 do |c6809|
    c6809.vm.hostname = "c6809.ambari.apache.org"
    c6809.vm.network :private_network, ip: "192.168.68.109"
  end

  config.vm.define :c6810 do |c6810|
    c6810.vm.hostname = "c6810.ambari.apache.org"
    c6810.vm.network :private_network, ip: "192.168.68.110"
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
