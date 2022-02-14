# setup dam server
class puppet_homelab::dam_setup {

  #case $::osfamily {
  #  'Debian': { include puppet_homelab::server_lite::apt_proxy }
  #  'RedHat': { include puppet_homelab::server_lite::yum_proxy }
  #}

  include puppet_homelab::dam_setup/dam_packages
  include puppet_homelab::dam_setup/dam_user
  

}
