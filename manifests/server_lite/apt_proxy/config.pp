# Class that accually adds the apt-proxy config for the client
class puppet_homelab::server_lite::apt_proxy::config {
  file { '/etc/apt/apt.conf.d/proxy.conf':
    mode   => '0444',
    owner  => root,
    group  => root,
    source => 'puppet:///modules/puppet_homelab/apt_proxy/proxy.conf'
  }
}
