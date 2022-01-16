# basic server setup
class puppet_homelab::server_lite {

  include puppet_homelab::server_lite::packages
  include puppet_homelab::server_lite::ansible_user
  include puppet_homelab::server_lite::hosts
  include puppet_homelab::server_lite::locate
  include puppet_homelab::server_lite::motd
  include puppet_homelab::server_lite::sshkeys
  include puppet_homelab::server_lite::sudo_group
  include puppet_homelab::server_lite::cron::puppet_restart
  case $::osfamily {
    'Debian': { include puppet_homelab::server_lite::apt_proxy }
    'RedHat': { include puppet_homelab::server_lite::yum_proxy }
  }

}
