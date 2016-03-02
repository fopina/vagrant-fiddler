# -*- mode: ruby -*-
# vi: set ft=ruby :

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
end
