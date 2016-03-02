# -*- mode: ruby -*-
# vi: set ft=ruby :

required_plugins = %w( vagrant-reload vagrant-triggers )
required_plugins.each do |plugin|
  system "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
end

Vagrant.configure(2) do |config|
  config.vm.box = "modernIE/w7-ie9"
  config.vm.box_check_update = false
  config.vm.network "forwarded_port", guest: 8888, host: 8888  # Fiddler2 port

  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.linked_clone = true
    vb.name = "Fiddler"
  end

  config.vm.provision "install", type: "shell", path: "scripts/install_fiddler.ps1"
  config.vm.provision "setup", type: "shell", path: "scripts/setup_fiddler.ps1"
  config.vm.provision "rearm", type: "shell", inline: <<-SHELL
    slmgr /rearm
  SHELL
  config.vm.provision :reload

  # ToDo: fix certificate installation URL (because of port forwarding instead of bridged network)
  # http://docs.telerik.com/fiddler/Configure-Fiddler/Tasks/UseFiddlerAsReverseProxy
  # if (oSession.host.toLowerCase() == "webserver:8888") oSession.host = "webserver:80";
end
