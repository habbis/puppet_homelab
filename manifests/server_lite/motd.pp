class puppet_homelab::server_lite::motd {
  file {
    '/etc/motd':
      ensure  => 'present',
      mode    => '0444',
      owner   => 'root',
      group   => 'root',
      content => template('puppet_homelab/motd/motd.erb');
  }
}
