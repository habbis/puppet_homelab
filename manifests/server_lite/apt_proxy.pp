# Class to add apt-proxy if the operatingsystem supports it.
class puppet_homelab::server_lite::apt_proxy {
  case $::operatingsystem {
    /^(Debian|Ubuntu)$/:{ include puppet_homelab::server_lite::apt_proxy::config }
    /^(RedHat)$/:{ }
    default: {
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
    }
  }
}
