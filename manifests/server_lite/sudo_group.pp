class puppet_homelab::server_lite::sudo_group {

  group { 'admins':
    ensure  => present,
  }

file { '/etc/sudoers.d/admins':
   owner  => root,
   group  => root,
   mode   => '0440',
   source => 'puppet:///modules/puppet_homelab/sudo/groups/admins'
  }
}
