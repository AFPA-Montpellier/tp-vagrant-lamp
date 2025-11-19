Vagrant.configure("2") do |config|
  config.vm.define "lamp-server" do |node|
    node.vm.box = "debian/bookworm64"
    node.vm.hostname = "lamp-server"
    
    # Port forwarding: host 7676 → VM 80
    node.vm.network "forwarded_port", guest: 80, host: 7676
    
    # Dossier partagé avec permissions
    node.vm.synced_folder "./shared", "/var/www/html",
      owner: "www-data",
      group: "www-data",
      mount_options: ["dmode=755,fmode=644"]
    
    node.vm.provider :libvirt do |libvirt|
      libvirt.memory = 1024
      libvirt.cpus = 1
    end
    
    # Provisionnement
    node.vm.provision "shell", path: "provision.sh"
  end
end
