# -*- mode: ruby -*-
# vi: set ft=ruby :

required_plugins = %w( vagrant-reload )
required_plugins.each do |plugin|
  system "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
end

Vagrant.configure(2) do |config|
  config.vm.box = "modernIE/w7-ie9"

  config.vm.box_check_update = false

  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.linked_clone = true
    vb.name = "Fiddler"
  end

  config.vm.provision "rearm", type: "shell", inline: <<-SHELL
    slmgr /rearm
  SHELL

  config.vm.provision :reload

  # Download and install fiddler
  # https://d585tldpucybw.cloudfront.net/docs/default-source/fiddler/fiddler2setup.exe
end
