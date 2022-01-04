class puppet_homelab::remove_user {

  user { 'ubuntu':
    ensure      => absent,
    home        => '/home/ubuntu',
    shell       => '/bin/bash',
    managehome  => true,
    gid         => 'ubuntu',
  }
}
