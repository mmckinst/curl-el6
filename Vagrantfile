Vagrant.configure(2) do |config|

  config.vm.provision "shell", inline: "curl -s -o /etc/yum.repos.d/mmckinst-curl-el6.repo https://copr.fedoraproject.org/coprs/mmckinst/curl-el6/repo/epel-6/mmckinst-curl-el6-epel-6.repo"
  config.vm.provision "shell", inline: "yum -q -y upgrade curl"

  config.vm.box = "bento/centos-6.7"
end
