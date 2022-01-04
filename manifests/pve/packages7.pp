#Class for installing pve
class puppet_homelab::pve::packages7 {
  include puppet_homelab::pve::pve7_list
  package { 'proxmox-ve':
    ensure => installed,
  }
  package { 'xinetd':
    ensure => installed,
  }
  package { 'os-prober':
    ensure => purged,
  }
}
