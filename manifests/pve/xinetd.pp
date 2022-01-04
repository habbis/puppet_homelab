#Class for installing pve
class puppet_homelab::pve::xinetd {
  file {
    '/etc/xinetd.d/pve_443':
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      source  => 'puppet:///modules/puppet_homelab/pve/xinetd_pve_443';
    }
    service {
      'xinetd':
        ensure    => running,
        name      => xinetd,
        enable    => true,
        hasstatus => false,
        require   => Package['xinetd'];
    }
}
