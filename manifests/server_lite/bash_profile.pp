# Class for installing ssh on linux servers
class puppet_homelab::server_lite::bash_profile {
  case $::osfamily {
    'RedHat': { include puppet_homelab::server_lite::bash_profile::rhel }
    'Debian': { include puppet_homelab::server_lite::bash_profile::debian }
    default: {
      case $::operatingsystem {
        'Debian': {
          include puppet_homelab::server_lite::bash_profile::debian
          $osfamily = 'Debian'
        }
      }
    }
  }
}
