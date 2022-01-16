# Class for installing ssh on linux servers
class puppet_homelab::sshd {
  case $::osfamily {
    'RedHat': { include puppet_homelab::sshd::rhel }
    'Debian': { include puppet_homelab::sshd::debian }
    default: {
      case $::operatingsystem {
        'Debian': {
          include puppet_homelab::sshd::debian
          $osfamily = "Debian"
        }
      }
    }
  }
}
