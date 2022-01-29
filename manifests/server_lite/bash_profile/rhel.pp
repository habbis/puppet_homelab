# Class to manage bahs profile rhel
class puppet_homelab::server_lite::bash_profile::rhel inherits puppet_homelab::server_lite::bash_profile {

  file { '/etc/profile':
     owner  => root,
     group  => root,
     mode   => '0644',
     source => 'puppet:///modules/puppet_homelab/bash_profile/rhel/profile'
  }

}

