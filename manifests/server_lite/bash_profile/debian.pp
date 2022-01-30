# Class to manage bahs profile debian and ubuntu
class puppet_homelab::server_lite::bash_profile::debian inherits puppet_homelab::server_lite::bash_profile {

  file { '/etc/profile':
     owner  => root,
     group  => root,
     mode   => '0644',
     source => 'puppet:///modules/puppet_homelab/bash_profile/debian/profile'
  }

  file { '/etc/profile.d/colorls.sh':
     owner  => root,
     group  => root,
     mode   => '0644',
     source => 'puppet:///modules/puppet_homelab/bash_profile/colorls.sh'
  }
}
