# Class to add yum-proxy if the operatingsystem supports it.
class puppet_homelab::server_lite::yum_proxy {
  case $::operatingsystem {
    /^(RedHat|Rocky)$/:{ include puppet_homelab::yum_proxy::config }
    /^(Debian|Ubuntu)$/:{ }
    default: {
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
    }
  }
}
