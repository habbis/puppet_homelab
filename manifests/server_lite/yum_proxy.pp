# Class to add yum-proxy if the operatingsystem supports it.
class puppet_homelab::server_lite::yum_proxy {
  case $facts['os']['name'] {
    'RedHat','CentOS','Rocky':{ include puppet_homelab::server_lite::yum_proxy::config }
    /^(Debian|Ubuntu)$/:{ }
    default: {
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
    }
  }
}
