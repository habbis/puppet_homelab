class puppet_homelab::timedatectl  {


 unless $facts['timzone;'] == 'Europe/Oslo' {
  exec {
    'timedatectl':
      path        => ['/usr/bin/'],
      command     => 'timedatectl set-timezone "Europe/Oslo" ',
  }
 }
}
