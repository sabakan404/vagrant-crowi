# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "CentOS7"
  config.vm.box_url = "https://f0fff3908f081cb6461b407be80daf97f07ac418.googledrive.com/host/0BwtuV7VyVTSkUG1PM3pCeDJ4dVE/centos7.box"

  if Vagrant.has_plugin?("vagrant-proxyconf")
    config.proxy.http = "http://proxy.mycompany.co.jp:8080/"
    config.proxy.https = "http://proxy.mycompany.co.jp:8080/"
    config.proxy.no_proxy = "localhost,127.0.0.1"
  end

  config.vm.hostname = "crowi.example.com"
  config.vm.network "private_network", ip: "192.168.55.10"
  config.vm.provision :shell, path: "script/provision.sh"
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
  end
  #config.vm.network "forwarded_port", guest: 3000, host: 3000
end
