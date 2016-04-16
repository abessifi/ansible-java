# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box_check_update = false
  config.vm.synced_folder '.', '/vagrant' , disabled: true

  config.vm.define 'ansible-vm' do |cfg|
    cfg.vm.box = 'debian/jessie64'
    cfg.vm.hostname = 'ansible-vm'
    cfg.vm.network 'private_network', ip: '192.168.33.101'
    cfg.vm.provider 'virtualbox' do |v|
      v.name = 'ansible-vm'
      v.memory = 1024
    end
    cfg.vm.provision 'ansible' do |ansible|
      ansible.playbook = 'provision.yml'
      ansible.inventory_path = 'vagrant-inventory.ini'
      ansible.limit = 'ansible-vm'
      ansible.verbose = 'v'
    end
  end

end
