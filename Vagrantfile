Vagrant.configure("2") do |config|
  config.vm.define "archlinux" do |server|
    server.vm.box = "archlinux/archlinux"

    server.vm.provision "shell", privileged: false, path: "basic-setup.sh"
  end
end
