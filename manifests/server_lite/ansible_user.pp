class puppet_homelab::server_lite::ansible_user {

  user { 'ansible':
    ensure      => present,
    home        => '/home/ansible',
    shell       => '/bin/bash',
    managehome  => true,
    gid         => 'ansible',
    groups => 'admins',
  }

  group { 'ansible':
    ensure  => present,
  }
}
