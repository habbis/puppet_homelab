# Class that accually adds the apt-proxy config for the client
class puppet_homelab::server_lite::yum_proxy::config {
  file { '/etc/yum.conf':
    mode   => '0444',
    owner  => root,
    group  => root,
    source => 'puppet:///modules/puppet_homelab/yum_proxy/yum.conf'
  }
}
