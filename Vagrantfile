Vagrant.configure("2") do |config|

  config.vm.box = "archlinux/archlinux"

  config.vm.hostname = "vagrant"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.memory = "2048"
    vb.customize ["modifyvm", :id, "--vram", "256"]
  end

  config.vm.provision "shell", inline: <<-SHELL
    if [[ ! -f /usr/bin/reflector ]]; then
      pacman -Syu --noconfirm reflector
      reflector --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
    fi
    if [[ ! -f /usr/bin/git ]]; then
      pacman -S --noconfirm git
    fi
    if [[ ! -f /usr/bin/python3 ]]; then
      pacman -S --noconfirm python3
    fi
    sudo -u vagrant bash /vagrant/run_local.sh
  SHELL

end