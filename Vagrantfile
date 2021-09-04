# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vagrant.plugins = ["vagrant-hosts", "vagrant-hostmanager", "vagrant-vbguest"]

  nodes = [
    {'name' => 'centos7', 'hostname' => 'centos7.hacklab', 'ip' => '192.168.250.108', 'cpus' => 1, 'memory' => 512, 'box' => 'puppetlabs/centos-7.0-64-nocm', 'bootstrap' => true},
  ]

  if Vagrant.has_plugin?("vagrant-hosts")
    config.vm.provision :hosts do |provisioner|
      provisioner.add_localhost_hostnames = false
      provisioner.autoconfigure = true
      provisioner.sync_hosts = true
    end
  end

  config.vm.box = "puppetlabs/centos-7.0-64-nocm"
  config.vm.define "puppetserver" do |puppetserver|
      config.ssh.forward_agent = true
      puppetserver.vm.hostname = "puppetserver.hacklab"
      puppetserver.vm.network :private_network, ip: "192.168.250.20"
      puppetserver.hostmanager.aliases = "puppet"
      puppetserver.vm.provider "virtualbox" do |v|
        v.customize [ "modifyvm", :id, "--cpus", "2" ]
        v.customize [ "modifyvm", :id, "--memory", "2048" ]
      end
     puppetserver.vm.synced_folder ".", "/etc/puppetlabs/code/environments/production", create: true
     puppetserver.vm.provision :shell, path: ".vagrant-scripts/puppetserver.sh"
  end
 
  nodes.each do |node|
    config.vm.define node['name'] do |n|
        n.vm.hostname = node['hostname']
        n.vm.box = node['box']
        n.vm.provider "virtualbox" do |v|
          v.customize ["modifyvm", :id, "--ioapic", "on"]
          v.cpus = node['cpus']
          v.memory = node['memory']
        end
        n.vm.network "private_network", ip: node['ip']
          file_name = node['name'].split('.')[0]
        n.vm.provision :shell, path: ".vagrant-scripts/centos7.sh"
        end
  end
end
