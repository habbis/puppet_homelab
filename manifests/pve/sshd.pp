# Class for installing ssh on linux servers
class puppet_homelab::server_lite::sshd {
  case $::osfamily {
    'RedHat': { include puppet_homelab::server_lite::sshd::rhel }
    'Debian': { include puppet_homelab::server_lite::sshd::debian }
    default: {
      case $::operatingsystem {
        'Debian': {
          include puppet_homelab::server_lite::sshd::debian
          $osfamily = "Debian"
        }
      }
    }
  }
}
