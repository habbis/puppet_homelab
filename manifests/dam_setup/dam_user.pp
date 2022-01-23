class puppet_homelab::dam_setup::dam_user {

  user { 'dam':
    ensure      => present,
    home        => '/home/dam',
    shell       => '/bin/bash',
    managehome  => true,
    gid         => 'dam',
    groups => 'dam',
  }

  group { 'dam':
    ensure  => present,
  }
}
