#basic setup for /etc/hosts
class puppet_homelab::server_lite::hosts {

  file {
    '/etc/hosts':
      mode    => '0644',
      owner   => root,
      group   => root,
      content => template('puppet_homelab/etc_hosts/hosts.erb');
  }
}
