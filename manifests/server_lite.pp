# basic server setup
class puppet_homelab::server_lite {

  case $::osfamily {
    'Debian': { include puppet_homelab::server_lite::apt_proxy }
    'RedHat': { include puppet_homelab::server_lite::yum_proxy }
  }

  include puppet_homelab::server_lite::bash_profile
  include puppet_homelab::server_lite::packages
  include puppet_homelab::server_lite::ansible_user
  include puppet_homelab::server_lite::hosts
  include puppet_homelab::server_lite::locate
  include puppet_homelab::server_lite::motd
  include puppet_homelab::server_lite::sudo_group
  include puppet_homelab::server_lite::cron::puppet_restart

}
