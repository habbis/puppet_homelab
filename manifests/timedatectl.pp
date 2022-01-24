class puppet_homelab::timedatectl  {

  exec {
    'timedatectl':
      path        => ['/usr/bin/'],
      command     => 'timedatectl set-timezone "Europe/Oslo" ',
  }
}

