# Class for aptsource for java
class puppet_homelab::pve::pve7_list {
  apt::source { 'pve7_repo':
    comment  => 'This repo contains pve7',
    location => 'http://download.proxmox.com/debian/pve',
    release  => 'bullseye',
    repos    => 'pve-no-subscription',
  };
  apt::key {
    'pve7_repo':
      ensure => 'present',
      notify => Exec['apt_update'],
      id     => '28139A2F830BD68478A1A01FDD4BA3917E23BF59',
      source => 'https://enterprise.proxmox.com/debian/proxmox-release-bullseye.gpg';
  }

  file { '/etc/apt/sources.list.d/pve6_repo.list':
        ensure => 'absent'
  }
}
