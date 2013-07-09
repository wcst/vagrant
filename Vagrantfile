# -*- mode: ruby -*-
# vi: set ft=ruby :

# WCST Vagrant Workstation Config

Vagrant.configure("2") do |config|
	
  config.vm.define :web do |web_config|
    web_config.vm.box = "web"
    web_config.vm.box_url = "http://cloud-images.ubuntu.com/precise/current/precise-server-cloudimg-vagrant-i386-disk1.box"
    web_config.vm.network :private_network, ip: "192.168.33.10"
    web_config.vm.synced_folder "/private/var/domains/", "/var/domains/", :nfs => true
	  web_config.vm.synced_folder "./config", "/vagrant/config"
    web_config.vm.synced_folder "/var/labs", "/var/labs"
    web_config.vm.provision :shell, :path => "provision/lanp.sh"
  end


  config.vm.define :db do |db_config|
    db_config.vm.box = "db"
    db_config.vm.box_url = "http://cloud-images.ubuntu.com/precise/current/precise-server-cloudimg-vagrant-i386-disk1.box"
    db_config.vm.network :private_network, ip: "192.168.32.10"
    db_config.vm.network :forwarded_port, guest: 22, host: 2223
    #db_config.vm.synced_folder "/var/domains", "/var/domains"
    db_config.vm.synced_folder "./config", "/vagrant/config"
    db_config.vm.synced_folder "/var/labs", "/var/labs"
    #web_config.vm.forward_port 80, 8080
    db_config.vm.provision :shell, :path => "provision/sql.sh"
  end


end
