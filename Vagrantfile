# -*- mode: ruby -*-
# vi: set ft=ruby :

required_plugins = %w( vagrant-reload vagrant-triggers )
required_plugins.each do |plugin|
  system "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
end

Vagrant.configure(2) do |config|
  config.vm.box = "modernIE/w7-ie9"
  config.vm.box_check_update = false

  # Forward Fiddler2 port
  config.vm.network "forwarded_port", guest: 8888, host: 8888

  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.linked_clone = true
    vb.name = "Fiddler"
  end

  # Download Fiddler2 from https://www.telerik.com/download/fiddler/fiddler2
  # and install it (with silent flag)
  config.vm.provision "install", type: "shell", path: "scripts/install_fiddler.ps1"

  # Import pre-defined Registry settings for Fiddler (accept remote connections, listen for HTTPS, etc),
  # create startup shortcut and add Custom Rule to be able to provide certificate installation page
  # even with port forwarding
  config.vm.provision "setup", type: "shell", path: "scripts/setup_fiddler.ps1"

  # Rearm Win7 license as the base box is already expired...
  config.vm.provision "rearm", type: "shell", inline: <<-SHELL
    slmgr /rearm
  SHELL
  config.vm.provision :reload

  config.trigger.after [:up, :reload] do
    @machine.ui.success("Fiddler2 machine is now running!")
    @machine.ui.success("Configure your devices to use this host machine's IP/name with port 8888 as an HTTP/HTTPS proxy")
    @machine.ui.success("After you set up the device with the proxy, you can access http://my.fiddler to install Fiddler root certificate")
  end
end
